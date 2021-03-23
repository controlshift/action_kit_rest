# frozen_string_literal: true

shared_context 'stub_logger' do
  before(:each) do
    logger = double
    allow(logger).to receive(:debug).and_return(true)

    allow(ActionKitRest).to receive(:logger).and_return(logger)
    allow(Vertebrae::Base).to receive(:logger).and_return(logger)
  end
end
