require 'filters_spam'

module Inquiries
  class Inquiry < ActiveRecord::Base

    filters_spam :message_field => :message,
                 :email_field => :email,
                 :author_field => :name

    validates :name, :presence => true
    validates :email, :format=> { :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
    validates :message, :presence => true

    default_scope :order => 'created_at DESC'

    attr_accessible :name, :message, :email

    def self.latest(number = 7, include_spam = false)
      include_spam ? limit(number) : ham.limit(number)
    end

    def self.send_confirmation?

    end

    def self.notification_recipients

    end

    def self.notification_subject

    end

    def self.confirmation_subject

    end

  end
end