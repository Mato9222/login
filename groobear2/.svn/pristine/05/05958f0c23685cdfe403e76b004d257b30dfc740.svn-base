"use strict";

// Class definition
var KTProjectList = function () {    
    var initChart = function () {
        // init chart
        var element = document.getElementById("index_project_list_chart");
		var zone1El = document.querySelector("#projectZ01Count1");
		var zone1 = parseInt(zone1El.textContent);
		var ztwo2El = document.querySelector("#projectZ02Count2");
		var ztwo2 = parseInt(ztwo2El.textContent);
		var zthree3El = document.querySelector("#projectZ03Count3");
		var zthree3 = parseInt(zthree3El.textContent);
		var zfour4El = document.querySelector("#projectZ04Count4");
		var zfour4 = parseInt(zfour4El.textContent);
        if (!element) {
            return;
        }

        var config = {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [ztwo2,zthree3,zone1,zfour4],
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
