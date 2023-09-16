from data import connect_to_database  # Importez connect_to_database depuis votre module data
import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

cursor = connect_to_database().cursor()

def page_services_internes():
    st.title("Application Breizhibus")
    st.header("Services internes de Breizhibus")

    cursor.execute(
        "SELECT Lignes.nom AS Lignes, SUM(Frequentation.nombre_passagers) AS Total_Passagers "
        "FROM Frequentation "
        "INNER JOIN Horaire ON Frequentation.horaire = Horaire.id "
        "INNER JOIN Lignes ON Horaire.ligne = Lignes.id "
        "GROUP BY Lignes.nom;"
    )

    frequentations_lignes = cursor.fetchall()
    frequentations_lignes = pd.DataFrame(frequentations_lignes, columns=['Lignes', 'Total_Passagers'])  # Correct the column names

    st.subheader("Fréquentations par lignes:")
    plt.figure()
    plt.bar(frequentations_lignes['Lignes'], frequentations_lignes['Total_Passagers'], color='red')
    plt.xlabel("Lignes")
    plt.ylabel("Fréquentations")
    plt.xticks(rotation=45)
    st.pyplot(plt)

    cursor.execute(
        "SELECT Horaire.heure AS Horaire, SUM(Frequentation.nombre_passagers) "
        "AS Total_Passagers FROM Frequentation INNER JOIN Horaire ON "
        "Frequentation.horaire = Horaire.id GROUP BY Horaire.heure;")
    frequentations_heures = cursor.fetchall()
    frequentations_heures = pd.DataFrame(frequentations_heures, columns=['Horaire', 'Total_Passagers'])  # Correct the column names

    st.subheader("Fréquentations par heure:")
    plt.figure()
    plt.plot(frequentations_heures['Horaire'], frequentations_heures['Total_Passagers'], color='green')
    plt.xlabel("Horaire")
    plt.xticks(rotation=45)
    st.pyplot(plt)

    st.subheader("Camembert des fréquentations")
    plt.figure(figsize=(8, 8))
    plt.pie(frequentations_heures['Total_Passagers'], labels=frequentations_heures['Horaire'], autopct='%1.0f%%')
    plt.axis('equal')
    st.pyplot(plt)

    cursor.execute(
        "SELECT Frequentation.jour AS Jour, SUM(Frequentation.nombre_passagers) AS Total_Passagers "
        "FROM Frequentation GROUP BY Frequentation.jour;")
    frequentations_jours = cursor.fetchall()
    frequentations_jours = pd.DataFrame(frequentations_jours, columns=['Jour', 'Total_Passagers'])  # Correct the column names

    st.subheader("Fréquentations par jours:")
    plt.figure(figsize=(8, 8))
    plt.pie(frequentations_jours['Total_Passagers'], labels=frequentations_jours['Jour'], autopct='%1.1f%%')
    plt.axis('equal')
    st.pyplot(plt)

page_services_internes()
