// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', function(){
    Highcharts.chart('user_preference_container', {

        chart: {
            polar: true,
            type: 'line'
        },

        accessibility: {
            description: 'A spiderweb chart compares the allocated budget against actual spending within an organization. The spider chart has six spokes. Each spoke represents one of the 6 departments within the organization: sales, marketing, development, customer support, information technology and administration. The chart is interactive, and each data point is displayed upon hovering. The chart clearly shows that 4 of the 6 departments have overspent their budget with Marketing responsible for the greatest overspend of $20,000. The allocated budget and actual spending data points for each department are as follows: Sales. Budget equals $43,000; spending equals $50,000. Marketing. Budget equals $19,000; spending equals $39,000. Development. Budget equals $60,000; spending equals $42,000. Customer support. Budget equals $35,000; spending equals $31,000. Information technology. Budget equals $17,000; spending equals $26,000. Administration. Budget equals $10,000; spending equals $14,000.'
        },

        title: {
            text: 'User preference',
            x: -80
        },

        pane: {
            size: '80%'
        },

        xAxis: {
            categories: ['Indoor', 'Outdoor', 'Cardio', 'Strength',
                'Physicality', 'Mentality', 'Solo work', 'Team work'],
            tickmarkPlacement: 'on',
            lineWidth: 0
        },

        yAxis: {
            gridLineInterpolation: 'polygon',
            lineWidth: 0,
            min: 0
        },

        tooltip: {
            shared: true,
            pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}</b><br/>'
        },

        legend: {
            align: 'right',
            verticalAlign: 'middle',
            layout: 'vertical'
        },

        series: [{
            name: "User Today's activity preference",
            data: [gon.UserDailyQuestionnaire.indoor_score, gon.UserDailyQuestionnaire.outdoor_score, gon.UserDailyQuestionnaire.cardio_score, gon.UserDailyQuestionnaire.strength_score,
                gon.UserDailyQuestionnaire.physicality_score, gon.UserDailyQuestionnaire.mentality_score, gon.UserDailyQuestionnaire.solo_score,gon.UserDailyQuestionnaire.team_score],
            pointPlacement: 'on'
        }, 
        {
            name: 'User initial activity preference',
            data: [gon.UserData.indoor_score, gon.UserData.outdoor_score, gon.UserData.cardio_score, gon.UserData.strength_score,
                gon.UserData.physicality_score, gon.UserData.mentality_score, gon.UserData.solo_score,gon.UserData.team_score],
            pointPlacement: 'on'
        }
    ],

        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        align: 'center',
                        verticalAlign: 'bottom',
                        layout: 'horizontal'
                    },
                    pane: {
                        size: '70%'
                    }
                }
            }]
        }

    });
});