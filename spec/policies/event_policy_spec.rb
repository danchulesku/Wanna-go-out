require "rails_helper"

describe EventPolicy do
  subject { described_class.new(context, event) }
  let(:context) { UserContext.new(user, cookies)}
  let(:cookies) { {} }
  let(:scope) { Pundit.policy_scope(user, Event) }

  context "user - owner to event" do
    let(:user) { User.new }
    let(:event) { Event.new(user: user) }

    describe "#show?" do
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

    describe "#create?" do
      it { is_expected.to permit_action(:create) }
    end

    it "has access to all events" do
      expect(scope.to_a).to match_array(Event.all.to_a)
    end
  end

  context "user - foreign visitor" do
    let(:user) { User.new }
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

    describe "#create?" do
      it { is_expected.to permit_action(:create) }
    end

    it "has access to all events" do
      expect(scope.to_a).to match_array(Event.all.to_a)
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

    describe "#create?" do
      it { is_expected.not_to permit_action(:create) }
    end

    it "has access to all events" do
      expect(scope.to_a).to match_array(Event.all.to_a)
    end
  end
end
