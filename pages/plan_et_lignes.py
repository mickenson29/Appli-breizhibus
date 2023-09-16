import pandas as pd
from data import *
import matplotlib.pyplot as plt
import seaborn as sns

cursor = connect_to_database().cursor()

def page_horaires_par_lignes():

    # Page 1
    st.title("Breizhibus App")
    st.write("Carte de la ville")

    # Créez un DataFrame avec des données de localisation
    data = pd.DataFrame({
        'LATITUDE': [48.390394],  # Brest
        'LONGITUDE': [-4.486076]
    })

    # Utilisation de st.map() pour afficher la carte
    st.map(data)

    st.markdown("---")

    st.write("Carte reseau bus de la ville de brest")
    image_path = "reseauBrest.jpg"
    st.image(image_path, caption="", use_column_width=True)

    st.markdown("")
    st.markdown("")

    # Récupérer la liste des lignes
    cursor.execute("SELECT DISTINCT ligne from Horaire")
    lignes = cursor.fetchall()
    lignes = [ligne[0] for ligne in lignes]

    # Sélection de la ligne par l'utilisateur
    selected_lignes = st.selectbox("Sélectionnez une ligne :", lignes)

    # Récupérer les horaires pour la ligne sélectionnée
    cursor.execute("SELECT * FROM Horaire WHERE ligne = %s", (selected_lignes,))
    Horaire = cursor.fetchall()

    # Afficher les horaires
    st.subheader(f"Horaires pour la ligne {selected_lignes}:")
    for Horaire in Horaire:
        st.write(Horaire[1])

# Appel de la fonction pour afficher la page des horaires par lignes
page_horaires_par_lignes()