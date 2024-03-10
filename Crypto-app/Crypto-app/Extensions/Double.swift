//
//  Double.swift
//  Crypto-app
//
//  Created by Sherif Hamdy on 09/03/2024.
//

import Foundation

extension Double{
    
    /// convert double to currency formate with 2  fraction digits
    /// ```
    /// ex : 12345.12 to $12,345.12
    /// ```
    private var currencyFormate2:NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.alwaysShowsDecimalSeparator  = true
        formatter.currencyCode = "USD"
//        formatter.locale = .current
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits =  2
        formatter.currencySymbol = "$"
        return formatter
    }
    
    /// convert double to currency formate with 2 to 2 fraction digits as string
    /// ```
    /// ex : 12345.12 to "$12,345.12"
    /// ```
    func asCurrencyWith2FractionDigits()->String{
        let number = NSNumber(floatLiteral: self)
        return currencyFormate2.string(from: number) ?? "$0.00"
    }
    
    /// convert double to currency formate with 2 to 6 fraction digits
    /// ```
    /// ex : 12345.12 to $12,345.12
    /// ```
    private var currencyFormate6:NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.alwaysShowsDecimalSeparator  = true
        formatter.currencyCode = "USD"
//        formatter.locale = .current
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits =  6
        formatter.currencySymbol = "$"
        return formatter
    }
    
    /// convert double to currency formate with 2 to 6 fraction digits as string
    /// ```
    /// ex : 12345.12 to "$12,345.12"
    /// ```
    func asCurrencyWith2To6FractionDigits()->String{
        let number = NSNumber(floatLiteral: self)
        return currencyFormate6.string(from: number) ?? "$0.00"
    }
    
    /// convert double to string
    /// ```
    /// ex : 12.122 to "12.12"
    /// ```
    func asNumberString()->String{
        return String(format: "%0.2f", self)
    }
    
    /// convert double to string with percentage sign
    /// ```
    /// ex : 12.122 to "12.12%"
    /// ```
    func asPercentageString()->String{
        return self.asNumberString() + "%"
    }
}
