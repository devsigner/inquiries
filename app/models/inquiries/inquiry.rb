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
      settings['send-confirmation'] ? true : false
    end

    def self.notification_recipients
      settings['notification-recipients']
    end

    def self.notification_subject
      settings['notification-subject']
    end

    def self.confirmation_subject
      settings['confirmation-subject']
    end

    protected

    def self.settings
      @settings ||= YAML.load_file('config/inquiry.yml')
    end

  end
end