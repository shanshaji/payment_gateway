require "application_system_test_case"

class PaymentsTest < ApplicationSystemTestCase
  setup do
    @payment = payments(:one)
  end

  test "visiting the index" do
    visit payments_url
    assert_selector "h1", text: "Payments"
  end

  test "creating a Payment" do
    visit payments_url
    click_on "New Payment"

    fill_in "Amount", with: @payment.amount
    fill_in "Bank Account Number", with: @payment.bank_account_number
    fill_in "Bank Ifsc Code", with: @payment.bank_ifsc_code
    fill_in "Merchant Transaction Ref", with: @payment.merchant_transaction_ref
    fill_in "Payment Gateway Merchant Reference", with: @payment.payment_gateway_merchant_reference
    fill_in "Transaction Date", with: @payment.transaction_date
    click_on "Create Payment"

    assert_text "Payment was successfully created"
    click_on "Back"
  end

  test "updating a Payment" do
    visit payments_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @payment.amount
    fill_in "Bank Account Number", with: @payment.bank_account_number
    fill_in "Bank Ifsc Code", with: @payment.bank_ifsc_code
    fill_in "Merchant Transaction Ref", with: @payment.merchant_transaction_ref
    fill_in "Payment Gateway Merchant Reference", with: @payment.payment_gateway_merchant_reference
    fill_in "Transaction Date", with: @payment.transaction_date
    click_on "Update Payment"

    assert_text "Payment was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment" do
    visit payments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment was successfully destroyed"
  end
end
