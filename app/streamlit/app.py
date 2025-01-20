import streamlit as st

def main():
    st.set_page_config(
        page_title="Your App Name",
        page_icon="🚀",
        layout="wide"
    )
    
    st.title("Welcome to Your App")
    
    # Add your Streamlit app content here
    st.write("This is a template for your Streamlit application.")
    
if __name__ == "__main__":
    main()