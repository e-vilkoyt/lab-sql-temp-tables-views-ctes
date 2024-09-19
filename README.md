![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# LAB | Temporary Tables, Views and CTEs


<details>
  <summary>
   <h2>Learning Goals</h2>
  </summary>

  This lab allows you to practice and apply the concepts and techniques taught in class. 

  Upon completion of this lab, you will be able to:
  
- Create and use Temporary Tables, Views and Common Table Expressions (CTEs) in SQL to simplify complex queries and improve query performance.

  <br>
  <hr> 

</details>

<details>
  <summary>
   <h2>Prerequisites</h2>
  </summary>

Before this starting this lab, you should have learnt about:

- SELECT, FROM, ORDER BY, LIMIT, WHERE, GROUP BY, and HAVING clauses. DISTINCT, AS keywords.
- Built-in SQL functions such as COUNT, MAX, MIN, AVG, ROUND, DATEDIFF, or DATE_FORMAT.
- JOIN to combine data from multiple tables.
- Subqueries
- Temporary Tables, Views, CTEs
 
  <br>
  <hr> 

</details>


## Introduction

Welcome to the Temporary Tables, Views and CTEs lab!

In this lab, you will be working with the [Sakila](https://dev.mysql.com/doc/sakila/en/) database on movie rentals. The goal of this lab is to help you practice and gain proficiency in using views, CTEs, and temporary tables in SQL queries.

Temporary tables are physical tables stored in the database that can store intermediate results for a specific query or stored procedure. Views and CTEs, on the other hand, are virtual tables that do not store data on their own and are derived from one or more tables or views. They can be used to simplify complex queries. Views are also used to provide controlled access to data without granting direct access to the underlying tables.

Through this lab, you will practice how to create and manipulate temporary tables, views, and CTEs. By the end of the lab, you will have gained proficiency in using these concepts to simplify complex queries and analyze data effectively.


## Challenge

**Creating a Customer Summary Report**

In this exercise, you will create a customer summary report that summarizes key information about customers in the Sakila database, including their rental history and payment details. The report will be generated using a combination of views, CTEs, and temporary tables.

- Step 1: Create a View

First, create a view that summarizes rental information for each customer. The view should include the customer's ID, name, email address, and total number of rentals (rental_count).

- Step 2: Create a Temporary Table

Next, create a Temporary Table that calculates the total amount paid by each customer (total_paid). The Temporary Table should use the rental summary view created in Step 1 to join with the payment table and calculate the total amount paid by each customer.

- Step 3: Create a CTE and the Customer Summary Report

Create a CTE that joins the rental summary View with the customer payment summary Temporary Table created in Step 2. The CTE should include the customer's name, email address, rental count, and total amount paid. 

Next, using the CTE, create the query to generate the final customer summary report, which should include: customer name, email, rental_count, total_paid and average_payment_per_rental, this last column is a derived column from total_paid and rental_count.

## Requirements

- Fork this repo
- Clone it to your machine


## Getting Started

Complete the challenge in this readme in a `.sql` file.

## Submission

- Upon completion, run the following commands:

```bash
git add .
git commit -m "Solved lab"
git push origin master
```

- Paste the link of your lab in Student Portal.



