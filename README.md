# Travel New-Normal: Future Airbnb Concept

## TL;DR
- The COVID-19 pandemic led to a sharp drop in Airbnb users, and the company was on the verge of a cash shortage due to the cancellation process.
- Simultaneously with the layoffs, the company raised funds and changed its platform concept from short term rental to mid-long term rental.
- As remote work becomes more common for keeping social distancing, Airbnb users have seen a surge in its use as a workspace, with mid-July marking the first time in four months that more than one million room bookings were made. However, it is unsure that it will last and be sustainable.
- It is worth exploring current Airbnb raw data to 

## Company Overview
Airbnb is a U.S.-based startup in the private accommodation business and one of the world's largest marketplaces, with over 7 million places to stay and tens of thousands of original experiences, all provided by local hosts. Airbnb, which helps people achieve economic independence, has helped millions of hospitality entrepreneurs worldwide work on their spare rooms and the things they love to do and have helped promote communities through tourism. Airbnb is a company that connects people around the world and fosters community and trust.

## Domain of Interest
* **Why are you interested in this field/domain?**

The COVID-19 pandemic has hit our company, Airbnb, a private accommodation business that has been synonymous with the sharing economy, hard. The company has laid off about 25% of its workforce in response to the volatile home-stay, travel, and hospitality markets. Approximately 1,900 of the current 7,500 employees are affected to prepare the company for a significant shift in its business going forward. Also, since COVID-19, Airbnb has been forced to deal with free housing for medical professionals and 100% refunds for those who cancel trips. Despite raising $1 billion in dead financing, absolute profit declines in its core business have led to inevitable layoffs and the need to change its core business model to fit the new era.

Brian Chesky, Managing Director of the firm, sums up the travel market's reality at this stage in two ways.

1. We don’t know exactly when travel will return.
2. When travel does return, it will look different. 

As stated by the CEO, the company has been searching for a new business model for the travel market's new era since the pandemic happens. One of their efforts has been to change their platform concept from a short-term to a mid- long term accommodation model. Prior to the pandemic, our company focused on the business traveler and general traveler as the primary users of private accommodation facilities. However, they hypothesized that in the post-pandemic era, demand for vacation rental would be focused on workspaces for remote workers and facilities for spending time with small groups of friends, such as family members. Therefore, they changed their central business concept based on medium to long-term use cases. As a result, between May 17 and June 3, Airbnb's room bookings outperformed the YoY comparison. Besides, in mid-July, the company recorded more than 1 million overnight bookings for the first time in four months, and such bookings were characterized by a high number of "non-urban" bookings. A new form of Airbnb is beginning to emerge with social distance in mind. In other words, up until now, Airbnb has typically been a user behavior of "I'm going to use Airbnb because I'm going to visit a city called ~." But at this moment, it seems to be more of a reverse flow of "I want to stay in this Airbnb house or environment, so I'm going to visit a city called ~." 
My question is whether they should continue with the concept of medium- to long-term stay concept in 2021 and beyond, should the pandemic show a recovery trend. At this stage, as mentioned above, retention rates are higher than in the immediate aftermath of the pandemic. This is because people's lifestyles are changing from urban dwellings and office work to a work-from-home (work-from-anywhere) lifestyle. 

After identifying the data on Airbnb's availability and bookings at this stage, we examine the geographic and physical characteristics of properties that are growing in bookings despite the pandemic.

Based on these numerical facts, it is interesting to explore the future of travel, the potential of Airbnb and the potential in the hospitality business in the era of new travel new normal.


* **What other examples of data driven project have you found related to this domain (share at least 3)?**
  - [Airdna](https://www.airdna.co/), Airdna has a daily crawl and database of over 2 million Airbnb properties in 4,250 cities worldwide. The problem is the accuracy of the data. The problem with letting the crawler collect data on Airbnb properties is why they are not bookable on Airbnb's calendar. It's usually impossible to tell if a guest is booked and "blocked" or if the host is deliberately "blocking" the guest from being able to book. However, "AirDNA" invented a proprietary advanced artificial intelligence (AI) that can accurately recognize the confirmed reservation date (book) and the date when the reservation is not accepted (block) on Airbnb.In other words, AirDNA's data do not just reference data, but accurate data such as actual occupancy rates and room prices, and analysis based on these precise data is possible.
  
  - [Kaggle](https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data), Kaggle is a community of about 400,000 people working in machine learning and data science around the world. It is a platform that connects companies, governments, and other organizations with data analytics professionals - data scientists/machine learning engineers. This project specialized in analyzing the vacation rental data at New York City
  
  - [Towards Data Science, Exploring & Machine Learning for Airbnb Listings in Toronto](https://towardsdatascience.com/exploring-machine-learning-for-airbnb-listings-in-toronto-efdbdeba2644), The project explores Airbnb data by using machine learning listing in Toronto, Canada. It analyzes tendency of price range dependes on the neighborhoods and busiest month. 


* **What data-driven questions do you hope to answer about this domain (share at least 3)?**
  
    - What are the characteristics of the changes in the number of Airbnb bookings in North America before and after the pandemic?
  
    - What are the characteristics of changes in the number of bookings across all continents (North America, South America, Europe, Asia and Australia) before and after the pandemic?
  
    - As Airbnb claims, will Airbnb be used as a remote work place in the future at an increasing rate? Even if such use is currently increasing, is it sustainable?
    
    - When Airbnb started to show recover in terms of booking rate and what trigged that?

* **How the question can be answered?**
    - We begin with a step of sorting through the bookings, one by one, along the timeline and by country. We then identify properties whose bookings have been on the rise since the pandemic and consider whether each property has a geographic feature. I will also examine various aspects of the background to the surge in bookings, such as property amenities and price range.


## Data Source
We have colleced data from Inside Airbnb, which provides publicly available Airbnb platform datasets such as occupancy rate, listing geolocation, reviews, booking calender, and etc.
The data is updated monthly by country, allowing users to understand the current state of Airbnb based on the latest information. Inside Airbnb is not officially owned and operated; it is a project started by analyst Murray Cox and designer John Morris. The site's data collection methods use the following technologies：D3, Crossfilter, dc.js, Leaflet, Bootstrap, jQuery, Select2, Python, PostgreSQL.

We might use data from Booking.com and Kaggle so we can compare case by case situation. Full description is below.

* **How many observations (rows) are in your data?**
There is slightly difference between each country dataset but around 12000 rows.

* **How many features (columns) are in the data?**
There is slightly difference between each country dataset but the largest file is *<listings>* and it has 16 columns as follows.

1. id
2. name
3. host_id
4. host_name
5. neighbourhood_group
6. neighbourhood
7. latitude
8. longitude
9. roomt_type
10. price
11. minimum
12. number_of_reviews
13. last_reviews
14. reviews_per_month
15. calculated_host_listings_count
16. availability_365


* **What questions (from above) can be answered using the data in this dataset?**

    - We can analyze booking rate changes before and after pandemic. Then, we can take a look at house type and explore if they have any characteristics. We also compare country-by-country variation separately to infer how Airbnb was used in response to each country's response and situation during the pandemic. Additionally, we derive the average number of nights per user and analyze whether Airbnb's use for remote work is increasing.
    
    - Each dataset has the basically same file that is *<calender>*, *<listings>*, *<neighbourhoods>*, *<reviews>*.

* **calender.csv**, Information on whether or not the listing is available for booking and how much it is priced.
* **listings.csv**, Contains information about the property and the host who owns the property.　
* **neighbourhoods.csv**, Contains property information based on its geolocation
* **reviews.csv**, numerical data how many reviews each property received and the rate.

  - Basic information we can find out from the calendar which month's or week's price is high. It is possible to know the details of the registered properties and the correlation of features.
    
### Dataset 1: [Inside Airbnb, Seattle Washington, United States](http://insideairbnb.com/seattle/)
- Airbnb dataset for Seattle which contains above 4 files. In this analysis, we will use this as an example to capture trends in North America.
### Dataset 2: [Inside Airbnb, Tokyo, Japan](http://insideairbnb.com/tokyo/)
- Airbnb dataset for Tokyo which contains above 4 files. In this analysis, we will use this as an example to capture trends in Asian Pacific.

### Dataset 3: [Inside Airbnb, Melbourne, Australia](http://insideairbnb.com/)
- Airbnb dataset for Melbourne which contains above 4 files. In this analysis, we will use this as an example to capture trends in Oceania.

### Dataset 4: [Inside Airbnb, London, United Kingdom](http://insideairbnb.com/london/)
- Airbnb dataset for London which contains above 4 files. In this analysis, we will use this as an example to capture trends in Europe.

### Dataset 5: [Inside Airbnb, Cape Town, South Africa](http://insideairbnb.com/cape-town/)
- Airbnb dataset for Cape Town which contains above 4 files. In this analysis, we will use this as an example to capture trends in Africa.

### Dataset 6: [Inside Airbnb, Mexico City, Mexico](http://insideairbnb.com/mexico-city/)
- Airbnb dataset for Mexico City which contains above 4 files. In this analysis, we will use this as an example to capture trends in South America.

### Dataset 7: [Booking.com](https://developers.booking.com/api/commercial/index.html?version=2.3&page_url=possible-values)
- We might use Booking.com API which provides their platform reservation data so we can compare between Airbnb and typical OTA platform situation. We hope to find some coorelation trend in terms of the vacation rental property.This is official dataset.

### Dataset 8: [Kaggle, New York City Airbnb Open Data](https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data)
- We might use Kaggle's API Airbnb dataset so we can analyze single country (USA) Airbnb trend, then compare with Seattle's dataset from Inside Airbnb. This data set is actually also from Inside Airbnb.