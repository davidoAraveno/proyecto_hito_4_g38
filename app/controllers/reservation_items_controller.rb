class ReservationItemsController < ApplicationController
  def pay_with_paypal

      reservation = Reservation.find(params[:reservation_id])

      response = EXPRESS_GATEWAY.setup_purchase(
        reservation.total * 100,
        ip: request.remote_ip,
        return_url: process_paypal_payment_reservation_items_url,
        cancel_return_url: root_url,
        allow_guest_checkout: true,
        currency: "USD"
      )
    
      payment_method = PaymentMethod.find_by(code: 'PEC')
    
      Payment.create(
        reservation_id: reservation.id,
        payment_method_id: payment_method.id,
        state: 'processing',
        total: reservation.total,
        token: response.token
      )
    
      redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
    end




    def process_paypal_payment
      details = EXPRESS_GATEWAY.details_for(params[:token])
    
      express_purchase_option = {
        ip: request.remote_ip,
        token: params[:token],
        payer_id: details.payer_id,
        currency: 'USD'
      }
    
      price = details.params["order_total"].to_d * 100
      response = EXPRESS_GATEWAY.purchase(price, express_purchase_option)
    
      if response.success?
        payment = Payment.find_by(token: response.token)
        reservation= payment.reservation
        reservation.payed = true
    
        ActiveRecord::Base.transaction do
          reservation.save!
          payment.save!
        end
    
        redirect_to root_path(estado: 'compra lista'), notice: 'compra finalizada con exito'
    
      else
    
        redirect_to root_path, alert: 'la compra a fallado'
    
      end
    end

end
