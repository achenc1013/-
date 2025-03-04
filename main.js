// 轮播图功能
document.addEventListener('DOMContentLoaded', function() {
    const carousel = document.querySelector('.carousel-items');
    const items = document.querySelectorAll('.carousel-item');
    const totalItems = items.length;
    let currentIndex = 0;

    // 自动轮播函数
    function autoSlide() {
        currentIndex = (currentIndex + 1) % totalItems;
        carousel.style.transform = `translateX(-${currentIndex * 100}%)`;
    }

    // 设置自动轮播间隔
    setInterval(autoSlide, 5000);

    // 分类切换功能
    const categoryItems = document.querySelectorAll('.category-item');
    const softwareCards = document.querySelectorAll('.software-card');

    categoryItems.forEach(item => {
        item.addEventListener('click', () => {
            categoryItems.forEach(cat => cat.classList.remove('active'));
            item.classList.add('active');

            const category = item.dataset.category;
            
            softwareCards.forEach(card => {
                if (category === 'ALL' || card.dataset.category === category) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });

    // 下载记录功能
    const downloadHistoryBtn = document.querySelector('.download-history-btn');
    const downloadHistoryPopup = document.querySelector('.download-history-popup');
    const historyList = document.querySelector('.history-list');

    // 模拟下载记录数据
    const downloadHistory = [];

    // 显示/隐藏下载记录悬浮窗
    downloadHistoryBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        downloadHistoryPopup.classList.toggle('active');
        updateHistoryList();
    });

    // 点击其他地方关闭悬浮窗
    document.addEventListener('click', (e) => {
        if (!downloadHistoryPopup.contains(e.target) && 
            !downloadHistoryBtn.contains(e.target)) {
            downloadHistoryPopup.classList.remove('active');
        }
    });

    // 添加下载记录
    function addDownloadRecord(software) {
        const record = {
            name: software.name,
            icon: software.icon,
            time: new Date().toLocaleString()
        };
        downloadHistory.unshift(record);
        updateHistoryList();
    }

    // 更新下载记录列表
    function updateHistoryList() {
        historyList.innerHTML = downloadHistory.length ? 
            downloadHistory.map(record => `
                <div class="history-item">
                    <img src="${record.icon}" alt="${record.name}" class="history-item-icon">
                    <div class="history-item-info">
                        <div class="history-item-name">${record.name}</div>
                        <div class="history-item-time">${record.time}</div>
                    </div>
                </div>
            `).join('') :
            '<div class="history-empty">暂无下载记录</div>';
    }

    // 动态加载软件列表
    function loadSoftwareList() {
        fetch('php/get_software_list.php')
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    const softwareGrid = document.querySelector('.software-grid');
                    softwareGrid.innerHTML = data.data.map(software => `
                        <a href="detail.html?id=${software.id}" class="software-card" data-category="${software.category}">
                            <div class="software-image">
                                <img src="uploads/icons/${software.icon_path}" alt="${software.name}">
                            </div>
                            <div class="software-info">
                                <h3>${software.name}</h3>
                                <p>${software.description}</p>
                                <div class="software-tags">
                                    <span class="tag">${software.category}</span>
                                </div>
                            </div>
                        </a>
                    `).join('');
                }
            });
    }

    // 初始加载软件列表
    loadSoftwareList();
}); 