# Funnel Analysis of E-commerce website
## Scenarios
The company CEO isn’t happy with the volume of sales. Therefore, she asked you to investigate whether there is something wrong in the conversion funnel or, in general, if you could suggest how conversion rate can be improved.

I used SQL and Power BI to do Funnel analysis to find out potential reasons that stop our sales or conversion rate from growing and give some feasible advises to the Manager

## Questions:
-	What does the Funnel Website Chart look like?  Through which process we lost the most customers?

-	How does customer segmentation based on Gender and Device affect conversion rates?

-	What action do we need to do to improve this situation.

## Overview of the Data
The overview of the data shows that the customer's ID only appeared once on the Home page, 
which means that all the customers are new, only visited the website once, and didn’t return. This is a important thing to keep in mind

## Overview of the Funnel Chart & Trend Analysis:
The Frist thing, we should have a general idea of what the Funnel looks like without any further segmentation

![image](https://user-images.githubusercontent.com/126956224/228934591-ef5b021d-997e-4d34-b5ba-72635700ee2c.png)

From the Funnel chart above we can see that:

-	We have a **huge drop at every stage in the conversion journey**. Only half of our Home Page visitors 
when converting to Search Page, and also a huge reduction in the transition from Search Page to Payments Page and to Payments Confirmation Page

-	The conversion rate from the Payments Page to Payments Confirmation Page is very low, only 7.5%, **that effected on Sales Revenue**

**=> We need to consider what reason affects the conversion rate 
on each page such as the UX/UI of the pages, products, contents, photos, 
target customers, and payment methods,… And we should create a strategy in order to hold back the customers.**

**Next Question:**
When did the conversion rate drop happen? How conversion changed over time? Is there some abnormal date particular?

![image](https://user-images.githubusercontent.com/126956224/228935246-3655f62e-9582-40d2-aa2f-ff9a9fc8f8e0.png)

- Firstly, Let’s take a look at how the number of visitors of the home page changed over time.

- From the Time series chart above we can see that, there is a rise of visitors on Feb 1 and a obvious drop on Mar 1.

- From March to the end of April, visitors tend to increase again but not too much

**Trend of Conversion Rate**

![image](https://user-images.githubusercontent.com/126956224/228935812-9fec7eea-ad2a-4740-83a6-70b40ebd9f9f.png)

-	Search Page: the conversion rate was only about 60%, and suddenly dropped 20%, down to 40% from March 1 and maintained this rate until the end of April

-	Payment Page: The conversion rate from Search Page to Payment Page was very low from the beginning, 
only about 20%, and from March 1, it dropped rapidly to less than 10% and then the rate was only about 10%

-	Payment Confirmation Page: The rate is only half as low as that of Payment Page, only about 10%, 
and although the conversion rate of other pages has decreased from March 1st, 
but the conversion rate of Payment Confirmation Page tends to increase, however it was unstable

**=> From Trend analysis, we can see besides constantly low conversion rates on payment and payment confirmation pages. 
On March 1st something happened, which affected the decreased conversion rate**

Furthermore, we should also get a better understanding of which group of customers are mainly causing the decrease of conversion rate, 
that leads to our customer segmentation analysis

## Segmentation:

**Based on Gender**

![image](https://user-images.githubusercontent.com/126956224/228936167-701cc105-2c7a-42aa-bd5b-5327d906ba9b.png)

![image](https://user-images.githubusercontent.com/126956224/228936193-a1028b7b-6a85-4f16-bef6-72b97fb7f238.png)

-	Looking at the comparison of 2 genders, we can see both charts are quite balanced, **there is no huge distinction between the trend of 
conversion rate of Male group and Female group, they all changed in same direction.** , its mean that **gender might not be a factor that drives the decrease in conversion rate.**

-	A little bit different is **more females stayed until the end of the journey than males.**



**Base on Device**

![image](https://user-images.githubusercontent.com/126956224/228936654-d04d56f3-213a-4124-8d68-de489cddf503.png)

-	Looking at the Column Chart, we see a clear difference, the number of visitors to the Home Page and Search Page on Desktop is twice as much as on Mobile.

-	However, the number of visitors to the Payment Confirmation Page on Mobile is twice as much as on Desktop.

=> Therefore, it can be concluded that **although customers access and search for products a lot via on Desktop version, 
the number of products sold is more than on Mobile version.**

![image](https://user-images.githubusercontent.com/126956224/228936858-3a91fa23-70bd-491d-8176-a4c544b5333b.png)

Looking at the Trend of Conversion Rate based on Device chart, we know:

-	More than 60% of customers who have accessed to Desktop version of the website all over the time.

-	The decrease in Search Page Conversion Rate from March 1st  came from the Mobile version of the website.

-	The Desktop registers a drop in the conversion from Search to Payment from March 1st.

=> **The Mobile version of the website had better conversion rates than the Desktop version even though its absolute values were lower.**

## CONCLUSION:

-	A huge drop at every stage in Funnel Coversion Rate. 
The conversion rate from the Payments Page to Payments Confirmation Page is very low, only 7.5%, that effected on Sales Revenue

-	More females stayed until the end of the journey than males

-	Although customers access and search for products a lot via Desktop, the number of products sold is more than on Mobile version

While the above data is still lacking for deeper root cause analysis, I will make suggestions to improve conversion rates based on this result.

## RECOMMENDATION:

**Increase the number of visitors:**

- Acquire new visitors: Based on our findings, the number of visitors to the Home page is quite volatile. We can observe a large number of visitors for a period of time but then drop and unevenly. We may have been doing a new product release or promotion at that time or select another target customers,… We can do it again to test the change.

- Re-engage old customers: Besides finding new customers, we should also carry out re-marketing activities for the group of customers who have visited our website. This will help customers remember our website and will return to search and purchase when they need.

- Attract more customers to access from Mobile version

**Improve conversion rate:**

- Find out more about why conversion rates suddenly dropped on March 1st and got low rates later based on other data and activities during that time. It may be due to the end of promotions, A/B testing, CRO testing

- Re-evaluate and improve UX/UI Pages and checkout processes on both Mobile and Desktop version to find out what's stopping customers from switching between stages and between pages.

- Prioritize evaluation and upgrade Payment Page & Payment Confirmation Page on Desktop version



