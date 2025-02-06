# Abstract Creator
class PaymentProcessor
  def process_payment(amount)
    payment_gateway = create_processor
    payment_gateway.pay(amount)
  end

  # Factory Method (to be implemented by subclasses)
  def create_processor
    raise NotImplementedError, 'Subclasses must implement create_processor'
  end
end


# Concrete Creator for PayPal
class PayPalProcessor < PaymentProcessor
  def create_processor
    PayPalGateway.new
  end
end

# Concrete Creator for Stripe
class StripeProcessor < PaymentProcessor
  def create_processor
    StripeGateway.new
  end
end

# PayPal Payment Gateway (Product)
class PayPalGateway
  def pay(amount)
    puts "Processing PayPal payment of $#{amount}"
  end
end

# Stripe Payment Gateway (Product)
class StripeGateway
  def pay(amount)
    puts "Processing Stripe payment of $#{amount}"
  end
end

# Using PayPal
paypal_processor = PayPalProcessor.new
paypal_processor.process_payment(100)

# Using Stripe
stripe_processor = StripeProcessor.new
stripe_processor.process_payment(200)
