(function ()
{
    angular.module('app').filter('image', function ()
    {
        return function (images, length)
        {
            console.log(images);
            return _.sampleSize(images, length);
        };
    })
})();