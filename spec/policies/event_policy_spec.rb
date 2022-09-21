require "rails_helper"
require "pundit/matchers"


describe EventPolicy do
  include Pundit::Authorization
  subject { described_class.new(context, event) }
  let(:context) { UserContext.new(user, cookies)}
  let(:cookies) { {} }

  context "user - owner to event" do
    let(:user) { User.new }
    let(:event) { Event.new(user: user) }

    describe "#show?" do
      #before {authorize(user, event) }

      it { is_expected.to permit_action(:show) }
    end

    describe "#edit?" do
      it { is_expected.to permit_action(:edit) }
    end

    describe "#update?" do
      it { is_expected.to permit_action(:update) }
    end

    describe "#destroy?" do
      it { is_expected.to permit_action(:destroy) }
    end
  end

  context "user - foreign visitor" do
    let(:user) {User.new}
    let(:event) { Event.new }

    describe "#show?" do
      it { is_expected.to permit_action(:show) }
    end

    describe "#edit?" do
      it { is_expected.not_to permit_action(:edit) }
    end

    describe "#update?" do
      it { is_expected.not_to permit_action(:update) }
    end

    describe "#destroy?" do
      it { is_expected.not_to permit_action(:destroy) }
    end
  end

  context "user - not authorized(anonymous)" do
    let(:user) { nil }
    let(:owner) { User.new }
    let(:context) { UserContext.new(user, {})}
    let(:event) { Event.new(user: owner) }

    describe "#show?" do
      it { is_expected.to permit_action(:show) }
    end

    describe "#edit?" do
      it { is_expected.not_to permit_action(:edit) }
    end

    describe "#update?" do
      it { is_expected.not_to permit_action(:update) }
    end

    describe "#destroy?" do
      it { is_expected.not_to permit_action(:destroy) }
    end
  end
end
