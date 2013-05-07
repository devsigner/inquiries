module Inquiries
  class InquiryMailer < ActionMailer::Base

    def confirmation(inquiry, request)
      @inquiry = inquiry
      mail :subject   => I18n.t('inquiry.confirmation-subject'),
           :to        => inquiry.email,
           :from      => "no-reply@#{request.domain}",
           :reply_to  => Inquiries::Inquiry.notification_recipients.split(',').first
    end

    def notification(inquiry, request)
      @inquiry = inquiry
      mail :subject   => I18n.t('inquiry.notification-subject'),
           :to        => Inquiries::Inquiry.notification_recipients,
           :from      => "no-reply@#{request.domain}",
           :reply_to  => inquiry.email
    end

  end
end