;(function(window) {

var svgSprite = '<svg>' +
  ''+
    '<symbol id="icon-show" viewBox="0 0 1024 1024">'+
      ''+
      '<path d="M512 192C288.682 192 95.118 322.042 0 512c95.118 189.958 288.682 320 512 320 223.314 0 416.878-130.042 512-320C928.884 322.042 735.314 192 512 192zM764.45 361.704c60.162 38.374 111.142 89.774 149.436 150.296-38.292 60.522-89.276 111.922-149.438 150.296C688.854 710.514 601.558 736 512 736c-89.56 0-176.856-25.486-252.45-73.704-60.16-38.374-111.14-89.774-149.434-150.296 38.292-60.524 89.274-111.924 149.434-150.296 3.918-2.5 7.876-4.922 11.858-7.3C261.45 381.732 256 411.226 256 442c0 141.382 114.616 256 256 256 141.384 0 256-114.618 256-256 0-30.774-5.45-60.268-15.408-87.598C756.572 356.78 760.53 359.204 764.45 361.704L764.45 361.704zM512 410c0 53.02-42.98 96-96 96s-96-42.98-96-96 42.98-96 96-96S512 356.98 512 410z"  ></path>'+
      ''+
    '</symbol>'+
  ''+
    '<symbol id="icon-bianji" viewBox="0 0 1024 1024">'+
      ''+
      '<path d="M783.70558 287.073204 657.810223 161.183006l62.973774-62.946634c20.866068-20.837584 54.651907-20.837584 75.516952 0l50.351798 50.350758c20.866068 20.865213 20.866068 54.702879 0 75.56707L783.70558 287.073204zM417.966076 652.797723 292.069696 526.907525l342.253664-339.564719 125.894333 125.891222L417.966076 652.797723zM190.931177 756.041132l76.597607-204.593701 124.841308 124.864846L190.931177 756.041132zM756.299293 799.066041c17.622055 0 31.891621 14.270005 31.891621 31.892361 0 17.594727-14.269566 31.864732-31.891621 31.864732L192.418102 862.823134c-17.595448 0-31.866037-14.268982-31.866037-31.864732 0-17.622356 14.27059-31.892361 31.866037-31.892361L756.299293 799.066041z"  ></path>'+
      ''+
    '</symbol>'+
  ''+
    '<symbol id="icon-shape7" viewBox="0 0 1024 1024">'+
      ''+
      '<path d="M992 179.744 892.64 179.744 847.2 993.792C846.24 1010.72 832.224 1024 815.232 1024L209.408 1024C192.448 1024 178.4 1010.752 177.472 993.824L131.264 179.744 32 179.744C14.304 179.744 0 165.408 0 147.744 0 130.08 14.304 115.744 32 115.744L152.928 115.744C154.464 115.744 155.776 116.416 157.248 116.608 158.688 116.416 160.032 115.744 161.504 115.744L329.44 115.744 329.44 32C329.44 14.336 343.744 0 361.44 0L662.528 0C680.224 0 694.528 14.336 694.528 32L694.528 115.744 862.4 115.744C864.096 115.744 865.632 116.48 867.296 116.768 868.992 116.48 870.496 115.744 872.288 115.744L992 115.744C1009.696 115.744 1024 130.08 1024 147.744 1024 165.408 1009.696 179.744 992 179.744ZM630.528 64 393.44 64 393.44 115.744 630.528 115.744 630.528 64ZM195.36 179.744 239.648 960 784.992 960 828.544 179.744 195.36 179.744ZM669.312 900C668.672 900 668.096 900 667.456 899.968 649.824 898.944 636.352 883.84 637.344 866.176L671.008 273.056C672 255.392 687.36 242.176 704.736 242.912 722.4 243.936 735.872 259.04 734.88 276.672L701.216 869.824C700.256 886.848 686.144 900 669.312 900ZM512 900C494.304 900 480 885.664 480 868L480 274.88C480 257.216 494.304 242.88 512 242.88 529.696 242.88 544 257.216 544 274.88L544 868C544 885.664 529.696 900 512 900ZM355.36 899.968C354.752 900 354.144 900 353.536 900 336.672 900 322.592 886.848 321.632 869.824L287.968 276.672C286.976 259.04 300.448 243.936 318.08 242.912 335.296 242.112 350.848 255.392 351.84 273.056L385.504 866.176C386.496 883.84 373.024 898.944 355.36 899.968Z"  ></path>'+
      ''+
    '</symbol>'+
  ''+
    '<symbol id="icon-chakanxiaji" viewBox="0 0 1024 1024">'+
      ''+
      '<path d="M554.441113 923.193083c-28.183899-26.956955-55.812143-53.377698-83.772962-80.119759 109.135606-110.789269 217.362516-220.655516 326.083683-331.025229C688.194396 401.839041 579.867202 291.865347 470.585263 180.920536c28.013007-26.792203 55.642275-53.211922 83.772962-80.113619 134.057205 136.082328 269.416056 273.485745 405.115668 411.235039C823.828516 649.732921 688.583253 787.02889 554.441113 923.193083z"  ></path>'+
      ''+
      '<path d="M389.973294 511.73087C281.282826 401.39288 173.224762 291.697525 64.490292 181.313485c28.02324-26.734898 55.778374-53.214992 83.872223-80.015382 133.331681 135.344524 268.713045 272.7725 404.327722 410.43379C417.067372 649.402393 281.813922 786.700409 147.833465 922.702919c-27.945469-26.731828-55.655578-53.239552-83.762729-80.126922C173.136757 731.85836 281.343201 622.010533 389.973294 511.73087z"  ></path>'+
      ''+
    '</symbol>'+
  ''+
    '<symbol id="icon-quanxianguanli" viewBox="0 0 1024 1024">'+
      ''+
      '<path d="M630.784 413.696l77.824 0 0-163.84c0-96.256-77.824-172.032-172.032-172.032l-51.2 0c-96.256 0-172.032 77.824-172.032 172.032l0 69.632 73.728 0 0-67.584c0 0 6.144-92.16 92.16-92.16 81.92 0 63.488 0 63.488 0s88.064-4.096 88.064 86.016C632.832 342.016 630.784 413.696 630.784 413.696z"  ></path>'+
      ''+
      '<path d="M237.568 464.896l0 247.808c0 129.024 104.448 235.52 235.52 235.52l77.824 0c129.024 0 235.52-104.448 235.52-235.52L786.432 464.896 237.568 464.896zM544.768 669.696l0 75.776c0 16.384-12.288 28.672-28.672 28.672l-8.192 0c-16.384 0-28.672-12.288-28.672-28.672l0-75.776c-18.432-12.288-32.768-32.768-32.768-55.296 0-36.864 28.672-65.536 65.536-65.536s65.536 28.672 65.536 65.536C577.536 638.976 563.2 659.456 544.768 669.696z"  ></path>'+
      ''+
    '</symbol>'+
  ''+
    '<symbol id="icon-tupiantubiao" viewBox="0 0 1024 1024">'+
      ''+
      '<path d="M881.542986 114.003474 142.454968 114.003474c-47.143717 0-85.300758 38.157042-85.300758 85.300758l0 625.38949c0 47.089481 38.157042 85.299735 85.300758 85.299735l739.086995 0c47.143717 0 85.299735-38.211277 85.299735-85.299735L966.841697 199.305255C966.842721 152.160515 928.686702 114.003474 881.542986 114.003474zM909.994991 824.694745c0 15.71389-12.737092 28.452006-28.396747 28.452006L142.399709 853.146751c-15.659655 0-28.452006-12.737092-28.452006-28.452006L113.947703 689.768753c34.131355 24.152073 83.426061 49.460482 140.219555 49.460482 66.223261 0 137.131217-55.745628 212.230636-114.744347 76.203566-59.882855 154.942885-121.747855 223.094054-121.747855 122.1889 0 219.123626 107.576087 220.060975 108.623953l0.442068-0.385786L909.994991 824.694745zM909.994991 534.1116c-45.820582-37.605479-125.220956-88.278579-220.50202-88.278579-87.891769 0-174.459381 68.096934-258.272251 133.933385-64.126506 50.453089-130.514519 102.614076-177.052438 102.614076-65.340147 0-121.251551-48.02683-140.219555-66.331731L113.948727 199.305255c0-15.714913 12.792351-28.452006 28.452006-28.452006l739.197512 0c15.659655 0 28.396747 12.737092 28.396747 28.452006L909.994991 534.1116zM341.122703 284.550755c-62.859653 0-113.864304 51.003628-113.864304 113.863281 0 62.913888 51.004651 113.862257 113.864304 113.862257 62.912865 0 113.862257-50.948369 113.862257-113.862257C454.98496 335.553359 404.035568 284.550755 341.122703 284.550755zM341.563748 454.82072c-31.31931 0-56.682977-25.364691-56.682977-56.682977s25.363667-56.738235 56.682977-56.738235 56.684 25.418926 56.684 56.738235S372.883057 454.82072 341.563748 454.82072z"  ></path>'+
      ''+
    '</symbol>'+
  ''+
    '<symbol id="icon-cuohao" viewBox="0 0 1025 1024">'+
      ''+
      '<path d="M1008.200771 932.05449 588.221278 511.975001l420.079488-419.979493c20.998975-20.998975 20.998975-55.09731 0-76.196279-20.998975-20.998975-55.09731-20.998975-76.196279 0l-419.979493 419.979493L91.94551 15.799229c-20.998975-20.998975-55.09731-20.998975-76.196279 0-20.998975 20.998975-20.998975 55.09731 0 76.196279l420.079488 419.979493L15.849226 932.05449c-20.998975 20.998975-20.998975 55.09731 0 76.196279 20.998975 20.998975 55.09731 20.998975 76.196279 0L512.024999 588.171281l419.979493 420.079488c20.998975 20.998975 55.09731 20.998975 76.196279 0C1029.299741 987.151799 1029.299741 953.053464 1008.200771 932.05449L1008.200771 932.05449zM1008.200771 932.05449"  ></path>'+
      ''+
    '</symbol>'+
  ''+
    '<symbol id="icon-faren" viewBox="0 0 1024 1024">'+
      ''+
      '<path d="M567.899022 764.206861 510.476099 862.855155l-57.35949-98.648294 29.714809-200.703843 55.291374 0L567.899022 764.206861z"  ></path>'+
      ''+
      '<path d="M361.836606 865.411603c-103.579953-137.253784-70.391435-351.717541-80.62327-365.358644C32.344759 499.990533 24.854638 865.411603 24.854638 865.411603L361.836606 865.411603z"  ></path>'+
      ''+
      '<path d="M669.220561 865.411603l329.923794 0c-0.061419 0 0-367.277742-224.120667-367.277742C765.099957 511.530294 772.921339 727.061336 669.220561 865.411603z"  ></path>'+
      ''+
      '<path d="M512.486823 496.471515c-98.525455 0-183.167152-195.417764-183.167152-296.988001 0-101.692068 84.580277-183.039279 183.167152-183.039279 98.645273 0 182.288152 81.40863 182.288152 183.039279C694.774975 301.053751 611.132096 496.471515 512.486823 496.471515z"  ></path>'+
      ''+
    '</symbol>'+
  ''+
    '<symbol id="icon-yanzhengma" viewBox="0 0 1024 1024">'+
      ''+
      '<path d="M853.517211 173.315284c-8.147476 0.277612-16.121869 0.381941-23.948963 0.381941-205.609197 0-296.229157-89.057619-297.00583-89.886857l-20.491307-21.212618-20.638207 21.212618c-0.809251 0.933567-89.628432 89.886857-296.965857 89.886857-7.83169 0-15.771507-0.104329-23.990734-0.381941l-28.851239-0.92897 0 403.890962c0 105.756497 37.355273 260.005316 360.285327 378.025699l10.089959 3.685501 10.086361-3.685501c322.930053-118.020382 360.285327-272.269201 360.285327-378.025699l0-403.889963L853.517211 173.315284 853.517211 173.315284zM480.253084 680.763434l-186.070444-165.787796 49.419693-40.224128 98.939919 73.387643c0 0 136.580199-142.12364 268.505753-208.485247l18.833631 21.315948C729.881436 360.969854 565.013617 498.376493 480.253084 680.763434L480.253084 680.763434z"  ></path>'+
      ''+
    '</symbol>'+
  ''+
    '<symbol id="icon-yincang" viewBox="0 0 1024 1024">'+
      ''+
      '<path d="M539.23328 797.73184c-18.90304 0-35.97824 0-54.19008 0 0-54.52288 0-108.5952 0-163.72736-54.0928-3.82464-105.17504-16.0512-154.8032-38.64064-26.82368 46.39232-53.51936 92.56448-80.75776 139.6736-15.79008-9.09312-30.85824-17.77152-47.1296-27.14112 26.48064-45.94176 52.76672-91.55072 79.63648-138.16832-46.4128-29.2608-86.33856-65.47456-120.08448-110.13632-43.82208 25.25184-87.3984 50.36544-131.83488 75.97056-9.12384-15.7952-17.9456-31.06304-27.20768-47.104 43.38176-25.07776 85.82144-49.6128 129.00864-74.57792-32.39936-58.38848-51.42528-120.16128-55.53152-187.1872 17.98656 0 35.6096 0 53.94944 0 11.2896 117.11488 63.1808 212.17792 158.72512 281.79456 67.41504 49.12128 143.70816 72.68352 227.21024 71.36256 98.9184-1.56672 184.91904-36.33664 256.81408-104.11008 71.6032-67.49696 110.2592-151.4496 118.93248-249.47712 18.24256 0 35.67616 0 54.08768 0-3.9168 66.59584-22.79936 128.27136-55.11168 186.88512 43.41248 25.09312 86.17984 49.81248 130.19136 75.25376-9.0368 15.73888-17.82784 31.04768-27.09504 47.1808-44.42624-25.60512-88.36096-50.93376-132.9408-76.62592-33.24416 43.68896-72.37632 80.3072-119.54176 109.82912 26.73664 46.3872 53.1968 92.30336 80.14848 139.06944-15.81056 9.12896-31.0784 17.95072-47.10912 27.20768-27.25376-47.1552-53.96992-93.3632-80.30208-138.92096-23.28064 7.87456-45.14304 16.85504-67.82976 22.52288-25.04192 6.25152-50.76992 9.97888-76.35456 13.71136-8.3712 1.22368-11.18208 3.3792-11.09504 12.19072 0.46592 46.83776 0.22016 93.68064 0.22016 140.52352C539.23328 789.0688 539.23328 793.04192 539.23328 797.73184z"  ></path>'+
      ''+
    '</symbol>'+
  ''+
    '<symbol id="icon-duihao" viewBox="0 0 1024 1024">'+
      ''+
      '<path d="M430.858 898.13s120.218-225.567 258.54-420.7c106.742-150.61 239.82-282.46 239.82-282.46l-27.77-75.08s-157.86 106.66-285.696 237.568c-129.803 132.833-229.5 290.16-229.5 290.16L190.219 469.116l-80.158 82.944 320.798 346.07z" fill="" ></path>'+
      ''+
    '</symbol>'+
  ''+
'</svg>'
var script = function() {
    var scripts = document.getElementsByTagName('script')
    return scripts[scripts.length - 1]
  }()
var shouldInjectCss = script.getAttribute("data-injectcss")

/**
 * document ready
 */
var ready = function(fn){
  if(document.addEventListener){
      document.addEventListener("DOMContentLoaded",function(){
          document.removeEventListener("DOMContentLoaded",arguments.callee,false)
          fn()
      },false)
  }else if(document.attachEvent){
     IEContentLoaded (window, fn)
  }

  function IEContentLoaded (w, fn) {
      var d = w.document, done = false,
      // only fire once
      init = function () {
          if (!done) {
              done = true
              fn()
          }
      }
      // polling for no errors
      ;(function () {
          try {
              // throws errors until after ondocumentready
              d.documentElement.doScroll('left')
          } catch (e) {
              setTimeout(arguments.callee, 50)
              return
          }
          // no errors, fire

          init()
      })()
      // trying to always fire before onload
      d.onreadystatechange = function() {
          if (d.readyState == 'complete') {
              d.onreadystatechange = null
              init()
          }
      }
  }
}

/**
 * Insert el before target
 *
 * @param {Element} el
 * @param {Element} target
 */

var before = function (el, target) {
  target.parentNode.insertBefore(el, target)
}

/**
 * Prepend el to target
 *
 * @param {Element} el
 * @param {Element} target
 */

var prepend = function (el, target) {
  if (target.firstChild) {
    before(el, target.firstChild)
  } else {
    target.appendChild(el)
  }
}

function appendSvg(){
  var div,svg

  div = document.createElement('div')
  div.innerHTML = svgSprite
  svg = div.getElementsByTagName('svg')[0]
  if (svg) {
    svg.setAttribute('aria-hidden', 'true')
    svg.style.position = 'absolute'
    svg.style.width = 0
    svg.style.height = 0
    svg.style.overflow = 'hidden'
    prepend(svg,document.body)
  }
}

if(shouldInjectCss && !window.__iconfont__svg__cssinject__){
  window.__iconfont__svg__cssinject__ = true
  try{
    document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>");
  }catch(e){
    console && console.log(e)
  }
}

ready(appendSvg)


})(window)
