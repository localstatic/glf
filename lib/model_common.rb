module ModelCommon
  def ModelCommon.included(klass)
    klass.class_eval do 
      include DestroyedAt
    end
  end
end
