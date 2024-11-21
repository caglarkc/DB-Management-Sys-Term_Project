# Educational Insights Database

This project involves designing and implementing a database system to analyze demographic, educational, and extracurricular data for students. The system is designed to answer various queries, perform data analysis, and provide insights into education-related trends.

## Table of Contents
- [Project Description](#project-description)
- [Features](#features)
- [Entity-Relationship Diagram (ERD)](#entity-relationship-diagram-erd)
- [Database Schema](#database-schema)
- [Installation](#installation)
- [Usage](#usage)
- [Sample Queries](#sample-queries)
- [Contributing](#contributing)
- [License](#license)

---

## Project Description

The Educational Insights Database project provides a structured framework to store and analyze data about students, their families, schools, universities, and activities. The database is capable of answering complex queries and generating valuable insights for educators, researchers, and policymakers.

**Key Objectives:**
- Normalize and store demographic, educational, and extracurricular data.
- Facilitate complex queries involving average, sum, count, and grouping operations.
- Provide a scalable and maintainable database design.

---

## Features

- **Student Demographics**: Store and analyze data such as age, gender, and location.
- **Education Details**: Capture information about universities, high schools, and academic performance.
- **Scholarships**: Track bursary percentages and external scholarship details.
- **Extracurricular Activities**: Monitor club memberships, sports participation, and NGO projects.
- **Family Insights**: Store parental education and employment information.

---

## Entity-Relationship Diagram (ERD)

![ERD Diagram](path/to/erd-diagram.png)

The ERD showcases the database design, highlighting entities such as:
- **Kisiler (People)**: Primary demographic information.
- **Universiteler (Universities)**: Academic details.
- **Burslar (Scholarships)**: Scholarship information.
- **Liseler (HighSchools)**: High school data.
- **Aile Bilgileri (FamilyDetails)**: Family background.
- **Aktiviteler ve Kulüpler (ActivitiesAndClubs)**: Extracurricular participation.
- **Dil Yetkinlikleri (LanguageSkills)**: Language proficiency.

---

## Database Schema

The database consists of the following tables:
1. **Kisiler (People):** 
   - `id` (Primary Key)
   - `Cinsiyet`, `Dogum Yeri`, `Ikametgah Sehri`, `Dogum Yili`, `Yas`

2. **Universiteler (Universities):**
   - `id` (Primary Key)
   - `Universite Adi`, `Universite Turu`, `Bölüm`, `Universite Not Ortalamasi`

3. **Burslar (Scholarships):**
   - `id` (Primary Key)
   - `Burslu ise Burs Yuzdesi`, `Burslu ise Burs Yuzdesi Aralik`

4. **Liseler (HighSchools):**
   - `id` (Primary Key)
   - `Lise Adi`, `Lise Sehir`, `Lise Turu`

5. **Aile Bilgileri (FamilyDetails):**
   - `id` (Primary Key)
   - `Anne Egitim Durumu`, `Anne Calisma Durumu`, `Anne Sektor`

6. **Aktiviteler ve Kulüpler (ActivitiesAndClubs):**
   - `id` (Primary Key)
   - `Uye Oldugunuz Kulubun Ismi`, `Spor Dalindaki Rolunuz`

7. **Dil Yetkinlikleri (LanguageSkills):**
   - `id` (Primary Key)
   - `Ingilizce Biliyor musunuz?`

---

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/educational-insights-database.git
   cd educational-insights-database
   ```

2. Set up the MySQL database:
   - Import the schema from `schema.sql` using MySQL Workbench or the command line:
     ```bash
     mysql -u username -p database_name < schema.sql
     ```

3. Install required Python libraries:
   ```bash
   pip install pandas unidecode
   ```

4. Load the dataset:
   - Use the `load_data.py` script to populate the database:
     ```bash
     python load_data.py
     ```

---

## Usage

Run SQL queries directly on the database to extract insights. For example:
```sql
SELECT AVG(Universite_Not_Ortalamasi) AS Avg_GPA, Ikametgah_Sehri
FROM Kisiler
JOIN Universiteler ON Kisiler.id = Universiteler.Kisiler_id
GROUP BY Ikametgah_Sehri;
```

---

## Sample Queries

1. **Average GPA by City**:
   ```sql
   SELECT Ikametgah_Sehri, AVG(Universite_Not_Ortalamasi) AS Avg_GPA
   FROM Kisiler
   JOIN Universiteler ON Kisiler.id = Universiteler.Kisiler_id
   GROUP BY Ikametgah_Sehri;
   ```

2. **Count Students in Clubs**:
   ```sql
   SELECT COUNT(*) AS ClubMembers
   FROM AktivitelerVeKulupler
   WHERE Girisimcilik_Kulupleri_Tarzi = 'evet';
   ```

3. **Percentage of Full Bursaries**:
   ```sql
   SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Burslar)) AS FullBursaryPercentage
   FROM Burslar
   WHERE Burs_Yuzdesi = 100;
   ```

---

## Contributing

We welcome contributions! Please:
- Fork this repository.
- Create a new branch: `git checkout -b feature/YourFeatureName`
- Commit your changes: `git commit -m 'Add YourFeatureName'`
- Push to the branch: `git push origin feature/YourFeatureName`
- Submit a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
```

### **Nasıl Kullanılır?**
1. Markdown dosyasını bir `README.md` dosyası olarak kaydedin.
2. Proje dizinine ekleyin.
3. GitHub'a yüklerken bu dosya ana sayfa olarak gösterilecektir. 

Eğer eklemeler yapmak isterseniz, bana söyleyebilirsiniz! 😊
