import pymysql
import streamlit as st
from data import *
def main():
    st.title("Appli Breizhibus")

    # Message de bienvenue
    st.write(
        "**Nous sommes ravis de vous accueillir sur notre application de transport Breizhibus. "
        "Explorez nos fonctionnalités pour planifier vos trajets en Bretagne de manière simple et efficace.**"
    )

    # Ajouter un bouton pour continuer
    if st.button("Continuer"):
        st.success("Vous pouvez maintenant commencer à utiliser l'application !")

    image_path = "imageBienvenue.jpg"
    st.image(image_path, caption="", use_column_width=True)


if __name__== "__main__":
    main()