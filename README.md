# DATABASE-MIGRATION
COMPANY*: Codtech IT Solutions Private Limited
NAME*: Priyansh sahu
INTERN ID*: CTIS0111
DOMAIN*: SQL
DURATION*: 4 Weeks
MENTOR*: Neela Santhosh Kumar 




**Project:**  Data Migration (MySQL  PostgreSQL)

---

## 1. Project Snapshot

For my core internship project, I was tasked with something that sounds simple but is actually quite dangerous in the tech world: **moving data**. Specifically, migrating our organization’s legacy database from MySQL to PostgreSQL.

The goal wasn’t just to copy-paste files; it was to modernize our infrastructure without losing a single customer record or breaking the complex relationships between our data tables. By mixing visual tools like **DBeaver** with custom **Python scripting**, I managed to pull off a 100% accurate migration. It was a challenging ride that taught me the difference between "theory" and "production reality."

## 2. The "Why" Behind the Move

Well, our old MySQL setup was starting to show its age. As our data grew, we needed features that MySQL just struggled with. We moved to **PostgreSQL** because:

* **It’s Smarter:** It handles complex queries much faster.
* **It’s Stricter:** It forces us to keep our data clean (which saves headaches later).
* **Concurrency:** It handles multiple users reading and writing at the same time much better than our old setup.

## 3. My Toolkit

I didn't want to reinvent the wheel, so I chose tools that were reliable and easy to debug.

* **The Heavy Lifter:** **DBeaver.** This was my command center. It let me visualize the databases and handled the "easy" migrations with its built-in wizard.
* **The Problem Solver:** **Python (Pandas & SQLAlchemy).** When DBeaver couldn't handle the complex logic, I wrote Python scripts to clean and transform the data mid-flight.
* **The Safety Net:** **SQL Queries.** I used these to constantly check my work—counting rows and verifying checksums to sleep easy at night.

## 4. How I Did It (The Process)

The migration wasn't a one-click event. I broke it down into three phases to keep things under control.

### Phase 1: The Detective Work (Planning)

Before moving a single byte, I had to map out the differences. MySQL and Postgres speak slightly different languages.

* **The Boolean Issue:** MySQL uses `0` and `1` for "False" and "True." Postgres actually uses the words `FALSE` and `TRUE`. I had to note this down so I could convert them during the move.
* **The Timezone Trap:** MySQL didn't care about timezones, but Postgres does. I decided to standardize everything to UTC time to avoid confusion.

### Phase 2: The Migration (Execution)

This is where the rubber met the road. I realized that if I tried to move 1 million rows at once, my computer would crash.

* **The Strategy:** I wrote a Python script using a "chunking" method. Imagine moving a library of books—instead of carrying the whole shelf (which is heavy and dangerous), I moved them in boxes of 10,000.
* **The Benefit:** This meant if the process failed at record #50,000, I didn't have to start over from zero. I could just resume from the last box.

### Phase 3: The Order of Operations

Databases are like spiderwebs; everything is connected. I couldn't move the "Orders" table before I moved the "Users" table—because an order *belongs* to a user. If the user isn't there, the database throws an error. I had to map out a specific dependency tree to ensure parents arrived before their children.

## 5. The Bumps in the Road (Challenges)

No project goes perfectly, and this one was no exception. Here are the main hurdles I faced and how I fixed them.

### Challenge #1: The "True/False" Identity Crisis

**The Problem:** When I first ran the transfer, Postgres didn't understand MySQL's binary flags. It tried to put the number `1` into a Boolean column, and the migration failed.
**My Fix:** I added a transformation step in my Python script. Using the Pandas library, I forced the data to convert types: *“If you see a 1, turn it into True. If you see a 0, turn it into False.”* It worked like a charm.

### Challenge #2: The "Dirty Data" 

**The Problem:** Old databases are often messy. I found user names with broken emojis and weird characters that crashed my script because they weren't valid text.
**My Fix:** I upgraded my database connection to enforce strict **UTF-8 encoding**. For the few rows that were truly broken, I set up a "catch" system—instead of crashing the whole migration, the script would skip that one bad row and log it in a separate error file for me to fix manually later.

### Challenge #3: The ID Counter Glitch

**The Problem:** After the migration, I tried to create a new user in the new system, and it failed! It turned out Postgres didn't know that we already had 5,000 users. It tried to assign the ID `#1` to the new user, which obviously already existed.
**My Fix:** I ran a specific SQL command to "reset the counter." I told Postgres, *“Look at the highest ID we have (which was 5,000) and start counting from there.”*

## 6. The Verdict: Did it Work?

Trust, but verify. I didn't just assume the data was there; I proved it.

* ** The Headcount:** I counted the rows in the old database (45,230 orders) and the new database (45,230 orders). A perfect match.
* **The DNA Check:** I used an MD5 hash (a digital fingerprint) on the user email column. The fingerprint for the old data matched the new data exactly. This proved that not a single letter was changed or corrupted during the move.

## 7. What I Learned (Reflection)

This internship project taught me that data engineering is about **precision** and **anticipation**.

* I learned that tools like DBeaver are great, but knowing how to code in Python gives you the power to fix things when the tools fail.
* I learned that "Data Integrity" isn't just a buzzword—it's the difference between a successful project and a disaster.
* Most importantly, I gained the confidence to handle critical infrastructure. I walked in knowing the theory, but I’m walking out knowing how to actually *do* it.

---
outputs

<img width="1227" height="788" alt="Image" src="https://github.com/user-attachments/assets/6f94db50-92c4-42c6-9623-d912fa8e2178" />

<img width="1918" height="1066" alt="Image" src="https://github.com/user-attachments/assets/fa005670-5589-4276-8de3-aa6e3971ded2" />
