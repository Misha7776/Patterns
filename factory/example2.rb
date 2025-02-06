# Abstract Product
class NotificationService
  def send_notification(message)
    raise NotImplementedError, 'Subclasses must implement send_notification'
  end
end

# Concrete Products
class EmailNotification < NotificationService
  def initialize(smtp_server)
    @smtp_server = smtp_server
  end

  def send_notification(message)
    puts "Sending Email: #{message} via #{@smtp_server}"
  end
end

class SmsNotification < NotificationService
  def initialize(phone_number)
    @phone_number = phone_number
  end

  def send_notification(message)
    puts "Sending SMS: #{message} to #{@phone_number}"
  end
end

# Factory Method (Abstract Creator)
class NotificationFactory
  def create_notification
    raise NotImplementedError, 'Subclasses must implement create_notification'
  end
end

# Concrete Factory for Email
class EmailNotificationFactory < NotificationFactory
  def create_notification
    EmailNotification.new('smtp.example.com')
  end
end

# Concrete Factory for SMS
class SmsNotificationFactory < NotificationFactory
  def create_notification
    SmsNotification.new('+1234567890')
  end
end

# Client code remains decoupled from the specific implementation
email_factory = EmailNotificationFactory.new
email_service = email_factory.create_notification
email_service.send_notification('Hello via Email!')

sms_factory = SmsNotificationFactory.new
sms_service = sms_factory.create_notification
sms_service.send_notification('Hello via SMS!')
