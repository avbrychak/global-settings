class Settings < ActiveRecord::Base
  acts_as_singleton
  serialize :data, Hash

  private_class_method :instance

  def self.method_missing(meth, *args, &block)
    unless respond_to? meth
      if meth.to_s[-1] == "="
        data_set(meth.to_s[0..-2].to_sym, args[0])
      else
        data_get meth
      end
    else
      super
    end
  end

  def self.data_get key
    instance.data[key]
  end

  def self.data_set key, value
    instance.data[key] = value
    instance.save
    data_get key
  end

  def self.data
    instance
  end
end
