# "Programming Elixir ≥ 1.6" by Dave Thomas (2nd edition), Chapter 10. Processing Collections — Enum and Stream • 114, Exercise: ListsAndRecursion-8
# Write a function taxed_orders that takes both lists and returns a copy of the orders, but with an extra field, total_amount, which is the net plus sales tax. If a shipment is not to NC or TX, there’s no tax applied.

defmodule Taxes do
  @tax_rates %{NC: 0.075, TX: 0.08}

  @orders [
    %{id: 123, ship_to: :NC, net_amount: 100.00},
    %{id: 124, ship_to: :OK, net_amount: 35.50},
    %{id: 125, ship_to: :TX, net_amount: 24.00},
    %{id: 126, ship_to: :TX, net_amount: 44.80},
    %{id: 127, ship_to: :NC, net_amount: 25.00},
    %{id: 128, ship_to: :MA, net_amount: 10.00},
    %{id: 129, ship_to: :CA, net_amount: 102.00},
    %{id: 130, ship_to: :NC, net_amount: 50.00}
  ]

  def taxed_orders(orders, tax_rates) do
    orders
    |> Enum.map(fn order ->
      tax_rate = tax_rates[order.ship_to] || 0.0
      Map.put(order, :total_amount, order.net_amount * (1 + tax_rate))
    end)
  end
end
