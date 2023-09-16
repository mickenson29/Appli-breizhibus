import pymysql
import streamlit as st


# Fonction pour se connecter à la base de données
def connect_to_database():
    conn = pymysql.connect(
        host='localhost',
        user='root',
        password='*Poleespoire29*',  # Assurez-vous de remplacer par le mot de passe correct
        db='Appli_Breizhibus'
    )
    return conn



