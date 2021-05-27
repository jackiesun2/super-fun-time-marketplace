class BookingsController < ApplicationController

# Checks booking if the booking already exists by the user through the listing and current user
# If listing exists, flash alerts a message else creates the booking with the current user id and the listing params
# Redirects to the listing

    def create
        listing = Listing.find(params[:listing_id])
        if Booking.find_by(listing: listing, user: current_user)
            flash[:alert] = "You are already signed up"
        else
            Booking.create(user_id: current_user.id, listing: listing)
        end
        redirect_to listing
    end

# Checks booking if the booking already exists by the user through the listing and current user
# If booking exists, destroy booking else flash alert message
# Redirects to listing

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
