require 'Auth'

class Api::V1::BooksController < ApplicationController
  def index
    token = request.env['HTTP_AUTHORIZATION']
    if token && Auth.decode_token(token)
      render json: Book.all
    else
      render json: { error: { message: 'You need a valid token!' } }, status: 500
    end
  end
end
