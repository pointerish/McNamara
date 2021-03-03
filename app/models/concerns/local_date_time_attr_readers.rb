module LocalDateTimeAttrReaders
  extend ActiveSupport::Concern

  included do
    include ActiveModel::AttributeMethods
  end

  class_methods do
    def time_zone_attr_reader(attr)
      define_method :time_zone_reader do
        self.send(attr)
      end
    end

    def local_attr_reader(*attrs)
      # We use ActiveModel::AttributeMethods instead of manually registering methods
      attribute_method_suffix '_local'

      attrs.each { |attr| define_attribute_method attr }
    end

    alias_method :local_date_attr_reader, :local_attr_reader
    alias_method :local_time_attr_reader, :local_attr_reader
    alias_method :local_datetime_attr_reader, :local_attr_reader
  end

  private

    def attribute_local(attr)
      send(attr).in_time_zone(time_zone_reader)
    end
end