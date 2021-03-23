# frozen_string_literal: true

require 'spec_helper'

describe ActionKitRest::User do
  before :each do
    logger = double
    logger.stub(:debug).and_return(true)

    ActionKitRest.stub(:logger).and_return(logger)
    Vertebrae::Base.stub(:logger).and_return(logger)
  end

  subject { ActionKitRest.new(host: 'test.com') }

  describe 'retrieval' do
    let(:request_path) { 'user/1/' }

    context 'without basic auth' do
      before(:each) do
        stub_get(request_path).to_return(body: body, status: status,
                                         headers: { content_type: 'application/json; charset=utf-8' })
      end

      describe '.get' do
        let(:status) { 200 }

        context 'without phones' do
          let(:body) { fixture('user/object_without_phones.json') }

          it 'should return a user object' do
            expect(subject.user.get(1).email).to eq 'walkers@wawd.com'
          end
        end

        context 'with phones' do
          let(:body) { fixture('user/object_with_phones.json') }
          let(:phone_body) { fixture('phone/object.json') }

          it 'should include phones' do
            stub_get('phone/?user=1').to_return(body: phone_body, status: 200)
            expect(subject.user.get(1).phones.count).to eq 3
            expect(subject.user.get(1).phones.map(&:phone)).to match_array(%w[7755555555 7755555577 310-310-3310])
          end
        end
      end

      describe 'user not found' do
        let(:body) { '' }
        let(:status) { 404 }

        it 'should raise an exception' do
          expect { subject.user.get(1) }.to raise_error(ActionKitRest::Response::NotFound)
        end
      end
    end

    context 'with basic auth' do
      let(:body) { fixture('user/object_without_phones.json') }

      subject { ActionKitRest.new(host: 'test.com', username: 'alice', password: 'somesecret') }

      before(:each) do
        stub_get(request_path).with(basic_auth: %w[alice somesecret])
                              .to_return(body: body, status: 200, headers: { content_type: 'application/json; charset=utf-8' })
      end

      it 'should return a user object' do
        expect(subject.user.get(1).email).to eq 'walkers@wawd.com'
      end
    end
  end
end
