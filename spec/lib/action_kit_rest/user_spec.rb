require 'spec_helper'

describe ActionKitRest::User do
  before(:each) do
    @actionkit = ActionKitRest.new(host: 'test.com')

    logger = double
    logger.stub(:debug).and_return(true)

    ActionKitRest.stub(:logger).and_return(logger)
    Vertebrae::Base.stub(:logger).and_return(logger)
  end


  describe "retrieval" do
    let(:request_path) { 'user/1/' }

    before(:each) do
      stub_get(request_path).to_return(:body => body, :status => status,
                                       :headers => {:content_type => "application/json; charset=utf-8"})
    end

    describe ".get" do
      let(:status) { 200 }

      context 'without phones' do
        let(:body) { fixture('user/object_without_phones.json') }

        it 'should return a user object' do
          expect(@actionkit.user.get(1).email).to eq 'walkers@wawd.com'
        end
      end

      context 'with phones' do
        let(:body) { fixture('user/object_with_phones.json') }
        let(:phone_body) { fixture('phone/object.json') }

        it 'should include phones' do
          stub_get('phone/?user=1').to_return(:body => phone_body, :status => 200)
          expect(@actionkit.user.get(1).phones.count).to eq 3
          expect(@actionkit.user.get(1).phones.map(&:phone)).to match_array(['7755555555', '7755555577', '310-310-3310'])
        end
      end
    end

    describe 'user not found' do
      let(:body) { '' }
      let(:status) { 404 }

      it "should raise an exception" do
        expect { @actionkit.user.get(1) }.to raise_error(ActionKitRest::Response::NotFound)
      end
    end
  end
end