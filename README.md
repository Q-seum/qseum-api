# Qseum-API Documentation

Version 1   
Date: 7/4/18  
Authors: molbrown / jacobfh   
Date: 6/25/18   

> **ALL date/time responses are in UTC. Be sure to update to user's local time zone.**


## **1. Register New User**
**Request:**
POST api/v1/users

**Params:**

> `account` param refers to the full account number in the associated membership. Make sure a membership record exists for the user you create. (Is a string to enable dashes.)

`account:string`    
`username:string`  
`password:string`  
`email:string`  
`selfie:string` (URL for image saved in Firebase)

**Response:**
201 = User created, will display user credentials including generated api_token
400= Error type will display

## **2. Login** 
**Request:**
POST api/v1/logins

**Params:**   
`username:string`  
`password:string`

**Response:**
201 = Login created
````
token = "api_token"  
id = "id"
admin = boolean
````
401 = Unauthorized credentials

:::info
`api_token` exposed after login needs to be added to header for future authenticated actions.
:::

## **3. User Info**
> So, I think this URL will be what lives in the QR-code, then the `newVisit` URL will be what saves the visit with the employee's "Confirm" button. That visit needs some params, all which are exposed in this GET.

**Request:**
GET /api/v1/users/(:id)

**Response:**
200= Response includes user object, including any membership info of interest.

> **ALL date/time responses are in UTC. Be sure to update to user's local time zone.**

> Let us know if there is any membership info missing here that you would like.


``` JSON
{
    "links": {
        "self": "/api/v1/users/2",
        "newVisit": {
            "method": "POST",
            "href": "/api/v1/visits"
        }
    },
    "data": {
        "id": 2,
        "attributes": {
            "accountNumber": "4-1380533899",
            "username": "seed2",
            "email": "ayanabarrows@wildermanlabadie.io",
            "apiToken": "1dvPNZU2Xkyej6Sd3ZdJq217",
            "isAdmin": false,
            "accommodations": null,
            "membershipType": 2,
            "joinDate": "2017-11-06",
            "expirationDate": "2018-11-06",
            "visits": [
                {
                    "id": 18,
                    "primary": "Merl Glover",
                    "secondary": "Oral Bergstrom",
                    "email": "ayanabarrows@wildermanlabadie.io",
                    "phone": "1-678-012-3980 x1463",
                    "account": "4-1380533899",
                    "membershipType": 2,
                    "visitors": 2,
                    "date": "2018-06-28T18:42:45.306Z"
                },
                {
                    "id": 17,
                    "primary": "Merl Glover",
                    "secondary": "Oral Bergstrom",
                    "email": "ayanabarrows@wildermanlabadie.io",
                    "phone": "1-678-012-3980 x1463",
                    "account": "4-1380533899",
                    "membershipType": 2,
                    "visitors": 2,
                    "date": "2018-06-28T18:23:44.178Z"
                },
                {
                    "id": 16,
                    "primary": "Merl Glover",
                    "secondary": "Oral Bergstrom",
                    "email": "ayanabarrows@wildermanlabadie.io",
                    "phone": "1-678-012-3980 x1463",
                    "account": "4-1380533899",
                    "membershipType": 2,
                    "visitors": 2,
                    "date": "2018-06-28T18:19:55.831Z"
                },
                {
                    "id": 15,
                    "primary": "Merl Glover",
                    "secondary": "Oral Bergstrom",
                    "email": "ayanabarrows@wildermanlabadie.io",
                    "phone": "1-678-012-3980 x1463",
                    "account": "4-1380533899",
                    "membershipType": 2,
                    "visitors": 2,
                    "date": "2018-06-28T18:13:04.849Z"
                },
                {
                    "id": 14,
                    "primary": "Merl Glover",
                    "secondary": "Oral Bergstrom",
                    "email": "ayanabarrows@wildermanlabadie.io",
                    "phone": "1-678-012-3980 x1463",
                    "account": "4-1380533899",
                    "membershipType": 2,
                    "visitors": 2,
                    "date": "2018-06-28T18:12:29.413Z"
                },
                {
                    "id": 13,
                    "primary": "Merl Glover",
                    "secondary": "Oral Bergstrom",
                    "email": "ayanabarrows@wildermanlabadie.io",
                    "phone": "1-678-012-3980 x1463",
                    "account": "4-1380533899",
                    "membershipType": 2,
                    "visitors": 2,
                    "date": "2018-06-28T18:04:25.780Z"
                },
                {
                    "id": 12,
                    "primary": "Merl Glover",
                    "secondary": "Oral Bergstrom",
                    "email": "ayanabarrows@wildermanlabadie.io",
                    "phone": "1-678-012-3980 x1463",
                    "account": "4-1380533899",
                    "membershipType": 2,
                    "visitors": 2,
                    "date": "2018-06-28T18:01:03.913Z"
                }
            ],
            "selfie":(firebaseURL),
            "validSelfie": false
        }
    }
}
````
## **4. Validate a Selfie** 
> Only `admin` users are authenticated to make this call.

**Request:**
PATCH /api/v1/users/(:id)

**Params:**   
`valid_selfie:true`

## **5. Replace a Selfie** 

**Request:**
PATCH /api/v1/users/(:id)

**Params:**   
`selfie:string`  
`valid_selfie:false`

## **6. Create a Visit** 
**Request:**
POST /api/v1/visits

**Params:**   
`user_id:integer`   
`account:string`   
`visitors:integer`  

**Response:**
201 = Visit created, response will include all visits for the day, in descending order:

> **ALL date/time responses are in UTC. Be sure to update to user's local time zone.**

````JSON
[
    {
        "id": 18,
        "date": "2018-06-28T18:42:45.306Z",
        "primary": "Merl Glover",
        "secondary": "Oral Bergstrom",
        "email": "ayanabarrows@wildermanlabadie.io",
        "phone": "1-678-012-3980 x1463",
        "account": "4-1380533899",
        "membershipType": 2,
        "visitors": 2
    },
    {
        "id": 17,
        "date": "2018-06-28T18:23:44.178Z",
        "primary": "Merl Glover",
        "secondary": "Oral Bergstrom",
        "email": "ayanabarrows@wildermanlabadie.io",
        "phone": "1-678-012-3980 x1463",
        "account": "4-1380533899",
        "membershipType": 2,
        "visitors": 2
    },
    {
        "id": 16,
        "date": "2018-06-28T18:19:55.831Z",
        "primary": "Merl Glover",
        "secondary": "Oral Bergstrom",
        "email": "ayanabarrows@wildermanlabadie.io",
        "phone": "1-678-012-3980 x1463",
        "account": "4-1380533899",
        "membershipType": 2,
        "visitors": 2
    },
    {
        "id": 15,
        "date": "2018-06-28T18:13:04.849Z",
        "primary": "Merl Glover",
        "secondary": "Oral Bergstrom",
        "email": "ayanabarrows@wildermanlabadie.io",
        "phone": "1-678-012-3980 x1463",
        "account": "4-1380533899",
        "membershipType": 2,
        "visitors": 2
    },
    {
        "id": 14,
        "date": "2018-06-28T18:12:29.413Z",
        "primary": "Merl Glover",
        "secondary": "Oral Bergstrom",
        "email": "ayanabarrows@wildermanlabadie.io",
        "phone": "1-678-012-3980 x1463",
        "account": "4-1380533899",
        "membershipType": 2,
        "visitors": 2
    },
    {
        "id": 13,
        "date": "2018-06-28T18:04:25.780Z",
        "primary": "Merl Glover",
        "secondary": "Oral Bergstrom",
        "email": "ayanabarrows@wildermanlabadie.io",
        "phone": "1-678-012-3980 x1463",
        "account": "4-1380533899",
        "membershipType": 2,
        "visitors": 2
    },
    {
        "id": 12,
        "date": "2018-06-28T18:01:03.913Z",
        "primary": "Merl Glover",
        "secondary": "Oral Bergstrom",
        "email": "ayanabarrows@wildermanlabadie.io",
        "phone": "1-678-012-3980 x1463",
        "account": "4-1380533899",
        "membershipType": 2,
        "visitors": 2
    }
]
````

## **7. Create an Issue** 
**Request:**
POST /api/v1/issues

**Params:**   
`user_id:integer`  
`text:text`

**Response:**
201 = Issue created, response will be issue details:

> **ALL date/time responses are in UTC. Be sure to update to user's local time zone.**

````JSON
{
    "data": {
        "id": 3,
        "attributes": {
            "created": "2018-06-28T21:35:01.232Z",
            "updated": "2018-06-28T21:35:01.232Z",
            "text": "The sunscreen exhibit is out of sunscreen",
            "user": "one"
        }
    }
}
````
## **8. Get Today's Issues** 
> Only `admin` users are authenticated to make this call.

**Request:**
GET /api/v1/issues

**Response:**
201 = All issues submitted **Today**, in descending order:

> **ALL date/time responses are in UTC. Be sure to update to user's local time zone.**

````JSON
[
    {
        "user_id": 4,
        "created_at": "2018-06-28T21:43:45.323Z",
        "updated_at": "2018-06-28T21:43:45.323Z",
        "text": "I noticed that the womens bathroom by the lobby is out of paper towels."
    },
    {
        "user_id": 5,
        "created_at": "2018-06-28T21:35:01.232Z",
        "updated_at": "2018-06-28T21:35:01.232Z",
        "text": "The sunscreen exhibit is out of sunscreen"
    },
    {
        "user_id": 5,
        "created_at": "2018-06-28T21:34:37.769Z",
        "updated_at": "2018-06-28T21:34:37.769Z",
        "text": "The sunscreen exhibit is out of sunscreen"
    },
    {
        "user_id": 5,
        "created_at": "2018-06-28T21:33:55.066Z",
        "updated_at": "2018-06-28T21:33:55.066Z",
        "text": "The sunscreen exhibit is out of sunscreen"
    }
]
````

## **9. (Start) Reset a Password** 
**Request:**
POST /api/v1/password_resets

**Params:**   
`email:string`

**Response:**
201 = PasswordReset created

## **10. (Finish) Reset a Password** 
> User will click a unique link in their email to get to this page, ending with `/password_resets/(:id)/(:new_token)`
Grab those values for use in the Request path and Params.

**Request:**
POST /api/v1/password_resets/(:id)

**Params:**   
`new_token:string`   
`password:string`   
`used:true`   

**Response:**
201 = Response will be user's data.

## **11. Purchase Admission Tickets** 
> As a result of this request, user's intended recipient will receive an email containing an admission QR code.

**Request:**
POST /api/v1/charges

**Params:**  
`email:string`  
`name:string`  
`amount:integer` **total price should be submitted in cents, and include calculated sales tax**  
`source:token` **token returned from Stripe.js element**  
`general:integer`  
`senior:integer`  
`military:integer`  
`child:integer`  
`recip_email:string` **optional param, if intended ticket recipient is not buyer**  

Amount and ticket types are based on:  
General Admission	**$20**  
Senior	**$18**  
Military	**$18**  
Children ages 3-12	**$15**  

**Response:**
201 = charge created, response will include ticket info. Email will be sent upon charge creation.
```JSON
{
    "id": 5,
    "recip_email": null,
    "buyer_email": "email@gmail.com",
    "name": "Oliver Friend",
    "created_at": "2018-07-04T21:12:21.352-04:00",
    "updated_at": "2018-07-04T21:12:21.352-04:00",
    "redeemed": false,
    "general": 2,
    "senior": 1,
    "military": 3,
    "child": 1
}
```

## **12. Redeem a Ticket** 
> Scanning the QR code in the user's email will bring you to the `api/v1/tickets/(:id)` path that you need to PATCH.

**Request:**
PATCH /api/v1/tickets/(:id)

**Params:**
`redeemed:true`
