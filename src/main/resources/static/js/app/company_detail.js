var loadMoreCompanyJobUrl;
var currentPage = 0;

$(document).ready(function() {
    var currentUrl = window.location.href;
    var companyId = currentUrl.substr(currentUrl.lastIndexOf("/") + 1);
    loadMoreCompanyJobUrl = '/ajax/loadmore/company/' + companyId + '/job';
    loadPage();
});

function loadPage() {
    $.ajax({
        type: 'GET',
        url: loadMoreCompanyJobUrl,
        data: {page: currentPage},
        success: function(res) {
            console.log(res);
            if (res.content.length > 0) {
                $("#jobs").append(tmpl('tmpl-jobs', res.content));
                currentPage++;
            }
            if (res.last) {
                $("#btnLoadMoreJob").remove();
            }
        },
        error: function(res) {
            console.log('ERR:' + res);
        }
    });
}