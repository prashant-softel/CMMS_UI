class Currency {
  Currency({
    this.currencyCode,
    this.symbol,
  });
  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    currencyCode: json['currency_code'] as String? ?? '',
    symbol: json['symbol'] as String? ?? '',
  );

  String? currencyCode;
  String? symbol;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'currency_code': currencyCode,
    'symbol': symbol,
  };
}
