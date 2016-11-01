# frozen_string_literal: true
module Blacklight
  class Configuration::FacetField < Blacklight::Configuration::Field
    def normalize! blacklight_config = nil
      query.stringify_keys! if query

      self.collapse = true if collapse.nil?
      self.show = true if show.nil?
      self.if = show if self.if.nil?
      self.index_range = 'A'..'Z' if index_range == true

      super
      
      if single && tag.blank? && ex.blank?
        self.tag = "#{key}_single"
        self.ex = "#{key}_single"
      end

      self
    end
  end
end
