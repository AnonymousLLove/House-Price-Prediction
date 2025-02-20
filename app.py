from flask import Flask, request, jsonify
import joblib

# Load the trained model
model = joblib.load('house_price_model.pkl')

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    # Get data from request
    data = request.json

    # Extract the features from the JSON data
    features = [
        
        data['Newly Built'],
        data['Furnished'],
        data['Bedrooms'],
        data['Bathrooms'],
        data['Toilets'],
        data['state'],
        data['town'],
        data['Category']
    ]
    
    # Predict using the loaded model
    prediction = model.predict([features])
    
    # Return the prediction as a JSON response
    return jsonify({'price': prediction[0]})

if __name__ == '__main__':
    # app.run(debug=True)
    app.run(host="0.0.0.0", port=5000, debug=True)


#python3 -m venv venv source venv/bin/activate python3 app.py