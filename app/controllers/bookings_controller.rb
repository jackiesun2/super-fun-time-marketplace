class BookingsController < ApplicationController

    def create
        listing = Listing.find(params[:listing_id])
        if Booking.find_by(listing: listing, user: current_user)
            flash[:alert] = "You are already signed up"
        else
            Booking.create(user_id: current_user.id, listing: listing)
        end
        redirect_to listing
    end

    def destroy
        listing = Listing.find(params[:listing_id])
        if Booking.find_by(listing: listing, user: current_user)
            booking = Booking.find_by(listing: listing, user: current_user)
            booking.destroy
        else
            flash[:alert] = "You are not attending this event"
        end
        redirect_to listing
    end

end
