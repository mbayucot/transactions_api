module Api
  module V1
    class TransactionsController < ApplicationController
      def single
        transaction = Transaction.create!(transaction_params)
        render json: { status: 'success', transaction_id: transaction.transaction_id }, status: :created
      end

      def bulk
        Transaction.transaction do
          transactions = Transaction.create!(bulk_transaction_params[:transactions])
          render json: { status: 'success', processed_count: transactions.size }, status: :created
        end
      end

      private

      def transaction_params
        params.require(:transaction).permit(:transaction_id, :points, :user_id)
      end

      def bulk_transaction_params
        params.permit(transactions: %i[transaction_id points user_id])
      end
    end
  end
end
