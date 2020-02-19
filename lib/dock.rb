class Dock
    attr_reader :name,
                :max_rental_time,
                :rental_log
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    total_charge = boat.hours_rented * boat.price_per_hour
    max_charge = @max_rental_time * boat.price_per_hour
    receipt = {}
    receipt[:card_number] = @rental_log[boat].credit_card_number
    if total_charge > max_charge
      receipt[:amount] = max_charge
    else
      receipt[:amount] = total_charge
    end
    receipt
  end
end
