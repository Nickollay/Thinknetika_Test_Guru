class Badges::InterfaceStrategy
  def reward?(test_passage:, badge:)
    raise NotImplementedError, "#{self.class} method #{__method__} not implemented"
  end
end
