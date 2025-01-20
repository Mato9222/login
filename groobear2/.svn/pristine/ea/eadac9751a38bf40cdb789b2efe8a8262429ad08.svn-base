"use strict";

// Class definition
var KTProjectList = function () {    
    var initChart = function () {
        // init chart
        var element = document.getElementById("kt_project_list_chart");
		var zoneEl = document.querySelector("#projectZ01Count");
		var zone = parseInt(zoneEl.textContent);
		console.log("병수야 안녕",zone);
		var ztwoEl = document.querySelector("#projectZ02Count");
		var ztwo = parseInt(ztwoEl.textContent);
		var zthreeEl = document.querySelector("#projectZ03Count");
		var zthree = parseInt(zthreeEl.textContent);
		var zfourEl = document.querySelector("#projectZ04Count");
		var zfour = parseInt(zfourEl.textContent);
		console.log("병수하이",zfour)
        if (!element) {
            return;
        }

        var config = {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [ztwo,zthree,zone,zfour],
                    backgroundColor: ['#FFC107', '#50CD89', '#00A3FF','#DC143C']
                }],
                labels: ['진행중', '완료됨', '시작전','중단됨']
            },
            options: {
                chart: {
                    fontFamily: 'inherit'
                },
                borderWidth: 0,
                cutout: '75%',
                cutoutPercentage: 65,
                responsive: true,
                maintainAspectRatio: false,
                title: {
                    display: false
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                },
                stroke: {
                    width: 0
                },
                tooltips: {
                    enabled: true,
                    intersect: false,
                    mode: 'nearest',
                    bodySpacing: 5,
                    yPadding: 10,
                    xPadding: 10,
                    caretPadding: 0,
                    displayColors: false,
                    backgroundColor: '#20D489',
                    titleFontColor: '#ffffff',
                    cornerRadius: 4,
                    footerSpacing: 0,
                    titleSpacing: 0
                },
                plugins: {
                    legend: {
                        display: false
                    }
                }                
            }
        };

        var ctx = element.getContext('2d');
        var myDoughnut = new Chart(ctx, config);
    }

    // Public methods
    return {
        init: function () {
            initChart();
        }
    }
}();

// On document ready
KTUtil.onDOMContentLoaded(function() {
    KTProjectList.init();
});
