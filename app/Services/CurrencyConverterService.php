<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class CurrencyConverterService
{
    public static function convert($amount, $from = 'KES', $to = 'USD')
    {
        // Mock conversion – in production use a real API like OpenExchangeRates
        $rates = ['USD' => 0.0075, 'EUR' => 0.0069, 'KES' => 1];
        return $amount * ($rates[$to] / $rates[$from]);
    }
}