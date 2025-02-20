
# House Price Prediction App

This project is a *Flutter-based House Price Prediction Application* that combines the power of *data science* with a *mobile-friendly frontend*. Users can input details about a property, and the app predicts its market price based on the trained machine learning model.

## Project Overview

- **Frontend**: Developed using Flutter for a sleek and responsive user interface.
- **Backend**: Built with Python, utilizing data science and machine learning techniques to make accurate predictions.

The app is designed for *real estate enthusiasts* and *buyers/sellers* to estimate property prices quickly and easily in Nigeria.

---
 App Flow

### 1️⃣ *Input Screen*
The user fills out the fields for the prediction, including, furnishing status, number of bathrooms, toilets  bedrooms, if the property is newly built or not , state, town and building type.

<div align="center">
<img src="pictures/demo/home.png" width="400" alt="Home Page">
</div>

### 2️⃣ *Prediction Screen*
After submitting the form, the app displays the predicted house price.
<div align="center">
<img src="pictures/demo/predict.png" width="400" alt="Home Page">
</div>

---

## Features

### 🏠 *Fields for Prediction*
Users can input property details via an intuitive interface:
- **Category**: Dropdown menu for selecting the category of property.
<div align="center">
<img src="pictures/demo/category.png" width="400" alt="State page">
</div>

- **State**: Dropdown menu for selecting the state in Nigeria.
<div align="center">
<img src="pictures/demo/state.png" width="400" alt="State page">
</div>

- **Town**: Dropdown menu for the property’s town.
<div align="center">
<img src="pictures/demo/town.png" width="400" height:"200" alt="TownPage">
</div>

- **Number of Bedrooms**: Input for the number of bedrooms.

- **Number of Toilets and Bathrooms**: Input for the total number of restrooms.
  
- **Fully Furnished**: Yes/No option.
  
- **Newly Built**: Yes/No option.



## Technologies Used

### *Frontend*
- **Flutter**: For crafting the user interface.
- **Dart**: The programming language for Flutter.

### *Backend*
- **Python**: Used for developing the predictive backend.
- **Data Science Libraries**:
  - `pandas` and `numpy` for data manipulation.
  - `scikit-learn` for training the prediction model.
- **Flask**: For creating a REST API to connect the Python backend to the Flutter frontend.

---

## Setup Instructions

### 🛠️ *Backend Setup*
1. Clone the repository.
2. Navigate to the backend folder
3. Install dependencies: pip install -r requirements.txt
4. Run the Flask server: python app.py
   

### 📱 *Frontend Setup*
1. Navigate to the frontend folder
2. Install Flutter dependencies: flutter pub get
3. Run the app:flutter run
   

---

## How the Prediction Works

1. The user fills in the form on the Flutter frontend.
2. The app sends the data to the Python backend.
3. The backend uses a trained ML model to process the inputs and return the predicted price.
4. The prediction result is displayed in the app.

---

## Demo
- <div align="center">
<img src="pictures/demo/demo_video.gif" width="400" alt="State page">
</div>

## Future Improvements
- **Add more fields**: Additional property details like amenities, and age of the building.
- **Model improvement**: Incorporate more advanced ML algorithms.
- **Visualization**: Include charts and graphs for price trends and factor importance.

---

## Acknowledgments
This project was created as part of my learning journey in *Flutter and Data Science*. Contributions and feedback are welcome!

---

