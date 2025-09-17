"# SERVER-STATS.SH" 

# Server Performance Stats

This project provides a simple shell script *server-stats.sh* that analyzes basic server performance statistics on any Linux system.  
It helps system administrators quickly monitor CPU, memory, disk usage, and identify the top resource-consuming processes.

---

## 📌 Features
The script displays:
- *Total CPU usage*
- *Total Memory usage* (Free vs Used, including percentage)
- *Total Disk usage* (Free vs Used, including percentage)
- *Top 5 processes by CPU usage*
- *Top 5 processes by Memory usage*

### 🔧 Stretch Goals (Optional Enhancements)
- OS version
- Uptime
- Load average
- Logged-in users
- Failed login attempts

---

## 🚀 How to Run

Follow these steps to run the script:

1. *Clone the repository*:
   ```bash
   git clone https://github.com/<your-username>/server-stats.git
   cd server-stats

RUN IN COMMAND LINE

chmod +x server-stats.sh

./server-stats.sh

bash server-stats.sh
