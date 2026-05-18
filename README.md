# HCMC-LLM-Project

Automotive regulation document analysis chatbot using LLM and RAG.  
This repository combines the original HCMC project code and the later capstone/portfolio implementation files into one GitHub-ready structure.

> Project domain: UN ECE automotive braking regulations  
> Main task: PDF/legal document preprocessing → structured JSON/JSONL → vector retrieval → LLM-based Q&A

---

## 1. Project Overview

This project aims to build a law-specialized LLM/RAG system for automotive development researchers.  
The system helps users search and understand complex automotive regulations more efficiently by retrieving relevant regulation clauses and generating answers grounded in the source documents.

The project was developed as a team project and later organized into a single portfolio repository for easier review.

---

## 2. Purpose

Automotive development researchers often need to review long and technical legal documents during product development, validation, and compliance checking. Manual regulation review can be time-consuming and inefficient.

This project was designed to:

- Reduce the time required to search automotive regulations
- Help researchers understand regulation-related requirements more efficiently
- Convert unstructured legal documents into structured data
- Build a RAG-based chatbot that answers based on retrieved legal context
- Explore how LLMs can support domain-specific document analysis

---

## 3. Dataset

The project uses UN ECE motor vehicle braking regulation documents.

Target documents include:

- UN ECE Regulation No. 78
- UN ECE Regulation No. 139
- UN ECE Regulation No. 150

The repository includes processed JSON/JSONL files used for retrieval experiments.

---

## 4. Repository Structure

```text
HCMC-LLM-Project-merged/
├── app/
│   ├── rag_streamlit.py        # Main Streamlit RAG chatbot app
│   ├── carbotapp.py            # Agent-style RAG application
│   ├── creationchatbot.py      # Earlier chatbot implementation
│   ├── PCJsonApp.py            # JSON-based Streamlit app
│   └── pc_agentRag.py          # Agent RAG workflow implementation
│
├── src/
│   ├── database/
│   │   ├── createDB.py         # Vector DB creation script
│   │   └── createDB_chroma.py  # Chroma DB creation script
│   └── legacy/                 # Additional experimental scripts
│
├── data/
│   └── processed/              # Processed JSON/JSONL regulation data
│
├── data_processing/            # PDF/DOCX extraction, formatting, chunking notebooks
├── images/                     # UI/logo assets
├── recall/                     # Recall-related data and analysis files
├── docs/
│   └── presentation.pptx       # Project presentation file
│
├── requirements.txt
├── .env.example
├── .gitignore
└── README.md
```

---

## 5. Data Preprocessing

The original regulation documents were provided in PDF or document format.  
To use them in a RAG pipeline, the documents were converted into structured text data.

### Preprocessing Flow

```text
PDF / DOCX Documents
→ Text Extraction
→ Markdown / Plain Text Formatting
→ Text Cleaning
→ JSON Conversion
→ Chunking
→ JSONL Dataset
→ Vector Embedding
→ Vector Database
```

### Main Tasks

- Extract text from PDF and DOCX regulation documents
- Clean unnecessary line breaks, symbols, and formatting noise
- Convert legal text into JSON/JSONL format
- Split long documents into retrievable chunks
- Preserve regulation structure such as chapters, clauses, and annexes when possible
- Prepare processed data for vector search

---

## 6. RAG System Architecture

The project uses a Retrieval-Augmented Generation structure.  
Instead of relying only on the LLM's internal knowledge, the system first retrieves relevant regulation chunks and then generates an answer based on the retrieved context.

### RAG Pipeline

```text
User Question
→ Query Processing
→ Vector Similarity Search
→ Retrieve Relevant Regulation Chunks
→ Prompt Construction
→ LLM Answer Generation
→ Final Answer Based on Retrieved Context
```

### Key Components

| Component | Description |
|---|---|
| Document Loader | Loads processed regulation documents |
| Text Splitter | Splits long legal texts into searchable chunks |
| Embedding Model | Converts text chunks into vector representations |
| Vector Database | Stores and retrieves chunks based on similarity |
| Retriever | Finds relevant clauses for a user query |
| LLM | Generates answers using retrieved legal context |
| Streamlit UI | Provides a chatbot-style interface |

---

## 7. Main Features

### Regulation-based Q&A

Users can ask questions about automotive braking regulations, and the chatbot retrieves relevant clauses before generating an answer.

### Semantic Search

The system can retrieve relevant legal clauses even when the user's question does not exactly match the wording of the regulation.

### Structured Document Processing

The project includes preprocessing notebooks and scripts for converting long legal documents into JSON/JSONL datasets.

### RAG / Agent Experiments

The repository includes multiple implementations, including a basic RAG chatbot and an agent-style RAG workflow that experiments with retrieval, grading, rewriting, and generation.

---

## 8. Installation

```bash
git clone https://github.com/YOUR_USERNAME/HCMC-LLM-Project.git
cd HCMC-LLM-Project
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

Create a `.env` file or enter your API key in the Streamlit sidebar depending on the app.

```bash
cp .env.example .env
```

Then edit `.env`:

```text
OPENAI_API_KEY=YOUR_OPENAI_API_KEY
```

---

## 9. How to Run

### Main Streamlit RAG App

```bash
streamlit run app/rag_streamlit.py
```

### Agent-style RAG App

```bash
streamlit run app/carbotapp.py
```

### Other Experimental Apps

```bash
streamlit run app/creationchatbot.py
streamlit run app/PCJsonApp.py
streamlit run app/pc_agentRag.py
```

Some scripts may require local vector DB files or additional path adjustments depending on your environment.

---

## 10. My Role

As a team member, I contributed to the design and development of the LLM/RAG-based legal document analysis system.

Main contributions include:

- Participated in defining the project problem and purpose
- Organized automotive regulation documents for analysis
- Contributed to preprocessing legal documents into structured data
- Worked on JSON/JSONL formatting and chunking strategy
- Participated in designing the RAG-based chatbot workflow
- Contributed to presentation materials and project documentation
- Organized the project files into a GitHub-ready portfolio repository

---

## 11. Tech Stack

### Language

- Python

### LLM / RAG

- OpenAI API
- LangChain
- Retrieval-Augmented Generation
- Prompt Engineering

### Vector Search

- FAISS
- ChromaDB
- Embedding Models

### Data Processing

- JSON / JSONL
- Markdown
- PDF / DOCX Text Extraction
- Text Chunking
- Pandas

### UI

- Streamlit

---

## 12. Project Outcome

This project demonstrates how LLM/RAG can be applied to domain-specific legal and technical documents.  
It shows an end-to-end workflow from document preprocessing to retrieval-based question answering.

For portfolio purposes, this project highlights:

- Unstructured document processing
- Domain-specific RAG design
- Vector search-based retrieval
- LLM answer generation grounded in source documents
- Team-based AI project experience

---

## 13. Future Improvements

- Improve chunking by preserving legal hierarchy more precisely
- Add citation output for retrieved regulation clauses
- Compare retrieval quality across different embedding models
- Add automated evaluation metrics for answer quality
- Improve Streamlit UI/UX
- Refactor experimental scripts into a cleaner package structure
- Expand the dataset to more automotive regulations

---

## 14. Portfolio Relevance

Although this project focuses on automotive regulations, the same structure can be extended to other fields that require analysis of large unstructured documents.

For cybersecurity and threat intelligence work, this experience can be connected to:

- Security report analysis
- CTI document search
- IOC/TTP extraction support
- MITRE ATT&CK mapping assistance
- Automated summarization of threat reports
- Structuring unstructured threat intelligence data
