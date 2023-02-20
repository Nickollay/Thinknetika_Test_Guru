#TODO: change name of class -> it will be abstract interface for badges

class Badges::InterfaceStrategy
  def reward?(test_passage)
    #TODO: implement some logic
    raise NotImplementedError, "#{self.class} method #{__method__} not implemented"
  end
end

#TODO: add concrete strategies
