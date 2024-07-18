from flask import Flask, request, render_template, jsonify
import mysql.connector
import json

connection = mysql.connector.connect(host='localhost',
                                     database='Northeastern_Coffee',
                                     user='root',
                                     password='*****')

cursor = connection.cursor()

def product_sale(product):
    query = f"""
    SELECT
        P.ProductName,
        SUM(C.Quantity) AS TotalSales,
        SUM(C.Quantity * P.ProductPrice) AS TotalRevenue
    FROM
        Product P
    JOIN
        Contain C ON P.ProductID = C.ProductID
    WHERE P.ProductName = "{product}"
    GROUP BY
        P.ProductName;
    """
    cursor.execute(query)
    result = cursor.fetchall()

    return result

def store_sale(location):
    query = f"""
    WITH RankedProducts AS (
        SELECT
            C.ShopID,
            C.ShopName,
            C.ShopLocation,
            P.ProductID,
            P.ProductName,
            SUM(O.Quantity) AS TotalSales,
            RANK() OVER (PARTITION BY C.ShopID ORDER BY SUM(O.Quantity) DESC) AS ProductRank
        FROM
            CoffeeShop C
            JOIN CoffeeMachine CM ON C.ShopID = CM.ShopID
            JOIN Brews B ON CM.MachineID = B.MachineID
            JOIN Product P ON B.ProductID = P.ProductID
            JOIN Contain O ON P.ProductID = O.ProductID
            JOIN Orders Ord ON O.OrderID = Ord.OrderID
        GROUP BY
            C.ShopID,
            C.ShopName,
            C.ShopLocation,
            P.ProductID,
            P.ProductName
    )
    SELECT
        ShopName,
        ShopLocation,
        ProductName
    FROM
        RankedProducts
    WHERE
        ProductRank = 1 AND ShopLocation = "{location}"
    """
    cursor.execute(query)
    result = cursor.fetchall()
    print(result)
    return result

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route("/query", methods=['POST'])
def query():
    data = request.json
    tab_name = data.get('tabName')  


    if tab_name == 'MarketingSales':
        product = data.get('inputValue')
        result = product_sale(product)
        print(result)
        return jsonify({"result": result})

    elif tab_name == 'Stores':
        location = data.get('inputValue')
        print("location is",location)
        result = store_sale(location)
        print(result)
        return jsonify({"result": result})

    else:
        # Handle other tabs if needed
        return jsonify({"error": "Invalid tab name"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5050, debug=True)
