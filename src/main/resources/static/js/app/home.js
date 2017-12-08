var searchAutocompleteHomeUrl = '/ajax/autocomplete/home';

$(document).ready(function() {
    $('#select2-search-job').select2({
        ajax: {
            url:  searchAutocompleteHomeUrl,
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    title: params.term,
                    location: $('#select2-location').val()
                };
            },
            processResults: function (data) {
                var modifiedData = $.map(data, function (obj) {
                    obj.text = obj.title;
                    return obj;
                });
                return {
                    results: modifiedData
                };
            }
        },
        placeholder: '<i class="fa fa-search"></i> Search keyword',
        escapeMarkup: function (markup) { return markup; },
        minimumInputLength: 1
    });

    $("#select2-location").select2({
        placeholder: '<i class="fa fa-map-marker"></i> Search location',
        escapeMarkup: function (markup) { return markup; }
    });

    $("#btnSearch").click(function () {
       window.location.href = "/job/" + $("#select2-search-job").val();
    });

    $("#btnViewAllJobs").click(function () {
       window.location.href = "/jobs";
    });

    $("#btnViewAllCompanies").click(function () {
        window.location.href = "/companies";
    });
});