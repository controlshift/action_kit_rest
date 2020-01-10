require 'spec_helper'

describe ActionKitRest::AllowedUserField do
  let(:status) { 200 }

  subject { ActionKitRest.new(host: 'test.com', username: 'alice', password: 'somesecret') }

  before(:each) do
    logger = double
    logger.stub(:debug).and_return(true)

    ActionKitRest.stub(:logger).and_return(logger)
    Vertebrae::Base.stub(:logger).and_return(logger)

    stub_get(request_path).with(basic_auth: ['alice', 'somesecret'])
                          .to_return(body: response_body,
                                     status: status,
                                     headers: {content_type: "application/json; charset=utf-8"})
  end

  describe '#list' do
    let(:request_path) { 'alloweduserfield/' }
    let(:response_body) { fixture('allowed_user_field/list.json') }

    it 'should return a list of objects' do
      fields = subject.allowed_user_field.list
      fields.each do |field|
        expect(field).to respond_to(:name)
      end
    end
  end
end
