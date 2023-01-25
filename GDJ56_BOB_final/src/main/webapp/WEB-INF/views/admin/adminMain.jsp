<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ADMIN-HOME</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="${path}/resources/assets/css/tailwind.output.css" />
    <script
      src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
      defer
    ></script>
    <script src="${path}/resources/assets/js/init-alpine.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css"
    />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
      defer
    ></script>
    <script src="${path}/resources/assets/js/charts-lines.js" defer></script>
    <script src="${path}/resources/assets/js/charts-pie.js" defer></script>
    <script src="${path}/resources/assets/js/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <div
      class="flex h-screen bg-gray-50 dark:bg-gray-900"
      :class="{ 'overflow-hidden': isSideMenuOpen }"
    >
      <!-- Desktop sidebar -->
      <aside
        class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0"
      >
        <div class="py-4 text-gray-500 dark:text-gray-400">
          <a
            class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
            href="#"
          >
            BOB ADMIN PAGE
          </a>
          <ul class="mt-6">
            <li class="relative px-6 py-3">
              <span
                class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                aria-hidden="true"
              ></span>
              <a
                class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                href="${path }/admin/main.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAACXBIWXMAAAsTAAALEwEAmpwYAAAE4ElEQVR4nO2X/U9TVxjHm2W/uv2wRcUf5/wnnMCWKLK+UMpatcgWRRGXmZmZLDPgK5oyGQwFX3ip2nsrOLqIby1sUiMMhUgkOFBQEe69oE7ILFayWHpv+S7nVLAtF9tSMEvGk3yT5vT0ez7neW7Pea5CMR/z8T8Nd8OSD7BX8Y776pKNbufi/NHfFy2c9UXQZ3tf4th1IscclXi2TuKZVr/YOpFjSqV+Zi0eWN+TB1ykHnHG6dzOOFA1xNlmDczbb0mQeKZe5JkxiWfxJr2aU+cVrPGhPs8blqycBHTG1cQMhodVyySOvRwOSppOHHMRgmVpoKfbuWiD27nYFHOJxX5LksizIzOG4ycz6hZ5Rh3q/yLR+CESE9+dEZwksFtEjpHCLd5wfAdV4NhojxkOcy7slX7dPG+CyDGixDNZgWu44vWDrgTDnrAwZBdkN0GZo4bTg73sPY2T32XgssaA3zRrUbrVgH/un6Lf3XcW4F5nC8Z9I1R2psifSY6RRI5RTgImfBE/lGhYHBaQ7ILshsI+rFoWrqxP2krxo0GNDvWXGNZlU3Wqv0J+mhKDLSUY6arA4ZytFK7JfhaN1Qdel5tjXKHPZNggu3AlGlbQ0nKM/U1wzZYcFGuUeJSahae6LShXalCm1NDPZKxYo6Jz7OZcClhfUwlPnyXU54JiJkGOhenAxvosqMrdhGpVGs1YX0om9iWtxgVrOS5Vn8Luz5PxQLORfnchRQ9TdrosoO+veiqRs34aNSA55+Tg/v6zDIfSNWhVracAzap05Oq0uH7tEp67eLx4LqDlDwd26XVoVBnpHPOadPgkFxxny+UySOSI+oaQO4Q7avNQkKIEp92EIV02zqh0+Onbr9HV0QTPyyEKQTTmGcbdzus4unMHKpI1uKfNRFNhEWxlR9D6y26Zo4f1THfjyGePsxpDTWwHssFqUikYp92MvFWrYasoweDAHUjis0m4QD19cg+/mkuxPymZ/uaMIQNWpRa2fVlTsyhY10QM+OpuDTI4nKqm5WpTrUeOWo1rV2rhHhFkwQI1+uIRGq/UIkebgjZ1BvUgXlOyyDFHIs8gvfiDDUp0KTin0iN/Sya6bjfD83I4LFxgybu7buDn7d+ATU7FEZ0mtudQ4tmWUIOsz5aj0rQHjwfvwifJl9QXRqTkZtNe6iVzT9+IDvDxRYy770AaqHl9WxzaKbuw3VYN9vixIJExubnEg3jFClhH4Ej4hpsmTU7s3y67aHlRMS5fag4SGZObSzym6XTsEQPSZnOgxg8nnHkrgCLHHI4csDv3oNRbPMVkTgF5iz4iuLF240ax3Qiq+/lRA54/dxWFeYVRAdKDuse8ILLstRtNE4BS9663k0EuiucPtzMWetvX2bwdG5xif+W4p2v7nAN6+dOfKGYS5B1C7Dsx14DnZgRHsznAfkyaygmzkwe3wZz//RSdOPgD2JKCIJExubnE4/U/l30GoeojRSwhCuyqcC2/NAPRlr/3WKp4a51KEWtIvHXzbEKKfq9NBM57yziOmxG8i0SYSVfscOwzUWBWTvjOCtykmWBZSt4hYgCsjfmZiyS8ArOCtEciz3rCZsw/x+Hl2eVzBuSK11cQhY6jx7yAdMIix5YQiFdtGpGDNKCSwBoiviFiAkxI0xDN+ULzMR+K/178CzxLwzHdKucnAAAAAElFTkSuQmCC">
                </svg>
                <span class="ml-4">HOME</span>
              </a>
            </li>
          </ul>
          <ul>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path }/admin/members.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAACXBIWXMAAAsTAAALEwEAmpwYAAAHMklEQVR4nO2Xa1BTZxrHmZ392t0Pu1MvH/fyqbbs2Nnt9gIlXJwudRHxRiq0XhZr1YIKJFwkoJBABAuBgJBwByeACUrEcAvQC3KTcyBaRUEkBxyKRZFwYhfB7X/nPZjTEKHc7MzOrM/MfxI4b57n9z7Pe97nfZ2cXtpL+z81S8P63yHW6VeWxvV7Lca1iWzdmldfeJCugfHfUkOsP81YlRTDGmiGbSOa/W7NoBh2V3vfg9/MD7hm8yPjuq0W4zpwalhX8cLAqKFJV9rM1lAM+4RmrPg5kTEEuIuZdHH0M9Gw3pMHNK4rXzUYPWz5M82wlxaDoheSma3qYib+aO/TYlyzx2JcK1t1ibsZ6yaKsT5aMRzDy9Jltm529H/8XNfvY5ubf70iOIp5fIA2s09JAGPbDWRLjqEoXIicqEOobmifF6Tt1vc4m6ZG9KEQhAbuRdxREcoqamyZnOk2W4PsY0QU0MPiAlqyKAyZBZmNfeaIQ+I4VxoFfagHmiIEvKpD3ZEvCoBOZ5gDGLxTiK0bXntOyXFyG+RTetDqbYsTmW9yCSvoWLsoIJkFmY1tzdnKqq2sQ024+xy4JpvEbshVZvNwLdfuYbvzG/jorxsR5PYu/F7fwANu/4szKDP77AWyjjuuyUWNzEJc1PPebGnZalvQrKRENIgFMCQdRFX0NtSHu3Fw9SIB9MfdUX7+pwwSgMC338L0rTr8p98I1lSNaoUEu//2Jj5xdZn7lpvZi04rMbIt2DtSK5Qo/Mwd37dr0Xs5F736TNSmhqKtKBE5QR7ITEnDuYISFKsK8CXVD4X4KMyNJbhxSc1Bmi5ko6UwBce2+fI+b4/+wKl7kHVbNiDZ5+wByzQ6pAb5YIKuwnV9Dhf0Tl0h7reehzTAG8Wi3ejJPAxT1hFoxAHIPL4Po1cq0FWm4MbSFUp811qOsjMSaPILHffKy8vvEA6bcGFyAr7Mk+Lx9ctcFknQ+21amJtLoI0OQH/+sTmqObUHvYbZ7NmrW5eOojS5I+DUQh1n/uwNsULHbUOlyMDt2iI+0COqivtsVEu5rDkC9uUdRdWZCMzcbuDGkk8yvrlEgfJy/XPbUhfD7lw6IGNVOjro6HsA9WkZnvY1YKxDx5X2QWcldMkRuJZ1BBWiXehMOwhaeRgVIn9cO/s5Sk8G4+HVC1ypCeSTW3XITc9YoCVaFUsGfNbsn3Oir21BfbGSfzMbVQk4e2gLl7GL0bv57Nm+537uh6ovIrgJTXRfQpYsHi3fjizUs5e+DmmGbV2oVWWdTsbVUhlM+hyUxh3G+cif1l+vKpiT7e8qSSA0MXtgqkhET6EI6tRUUIOWhQCvLAvw5sgPuG+Zhmn4Mee0tEyLJLkU2vRITDef4jTVFIcIoTdavziItjOfwhAbiEbpPjQn7sdNVQhO+gjA6qO5sU8uxmDg6D6Ub/ZBcXAwmlpMKwckJSZwxG7dm4AkNgpxhmYkUb2c8jrboGtvgOpqByT6egR5ukC40RnxPpsg9/sQ+955EyGCt1Hzdy+Mv78Dj7x2Ydx1O6+Hrttw2d0bhiqjPWD1MjJozSCZuzs2BZU6H/HfUDzcfArc4su1sbB/uOCErwB+G17Dx284Y8x12xwwR5WEi+w6ijVtyYDDN0sT+u5c5X6Yclr+s3Cy9h6ITobho7c28v1250ZnpG0WYHQRwHMhIXZnxcntS4J7Qgn3zlBCEN29XY8khWpesHjjNxCL/REeJUBYxvso0SegLOc0SjKkKLqYgPg8P0SKXZH0sQC0l8+8gEUhEfxG3dI79sqSAGcoocwGONJbAl1dO6LlaThQ2zgHMDTEG0k6TyRVeiGmyB2ZuiMYHm0EM2JA9oVjSCzbwj0jEh13wbCLHw92z2UrKrcEoFiuXP76Q0/Aq9OUf8Xj7oNG0+DIj/3Xi9F5Zxyp6nOIS8lAVGoWRJl5EJ9y5QFOaTwQkfMBHk42YXS8GjFqH8RrNvHPJSo3pPr4Im/nXqg/C0NBqhqtvaN8ebvNk+86rcTIHcI0MDS3Jd21oKKqCVFpbjyATOuJsEx3mL/TYmBEg/AsT8jOzz4jOlnojsKC3IWuADqnlRo1NPEncqh0dFrdRCHyjAcPwGWx1ButNxS48m06ZBqfOc+kGg9k5z4PSJmtDzuZf/9hxYBcFhnWy3bktz+QqguKEBErRFz+M1CdJyq/DoXuKxG/NqVaL0iUH0CSsB+62q8cb3hPb/QP+s50+X+4KkAO0mz9lyMkUefAOHKLNUhKiYIk/lOkpAZBnrwfJ+IDcSLuABLlMag0OIA9uzTRZut+AjfdJfwRHTsWv4ssJZPzlZtepkhZaYb1tPl9IXA2IxcccodYOSBbueo1tzTQyffI8Yhi2KlFM8awU2Qsbba884sBiQtpFZHj/1t6x14hJ2GasaZzENwxjW2dhbcquhl2x5I7xKoA83v+SfSLB3ppL83pf8/+C+rUJrQC6fQbAAAAAElFTkSuQmCC">
                </svg>
                <span style="margin-left:12px;"class="ml-4">회원관리</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path }/admin/master.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
              <img style="width:35px;height:35px;"src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAACXBIWXMAAAsTAAALEwEAmpwYAAAFr0lEQVR4nO2X7U9TVxzHybK3bi+2qPhyD38EKrAlOJeNiTy3oECFFigVSoFh5lQysCCiFEWde6E4BZFNQGjPRagTcHM+oSa+UCNzA9tbpPcWqg5BjN/lHFco7S0UismS8Ut+ycl5+J7P/Z2H37lBQUu2ZP9Tc3ateg+7gt5yXlilcJpXlj89v2L5ok/icHS9axGJzCqSWqvAEavI/c5c4AgvkoMW0ZQoCOQdacAVkSPm4GinORjMu4KbFg2MdxjDrALheIGb4EUOs7rATTB4BxfqqTPatSpiCtAcfCZgsEfDnR9bBdI+J5Toy8m5x6PkQ3dNp3lFmtO8Uh/wElsF8hkvcCO+JrfYTag/XIyGI9tY2Vc/q8g5bY6OSE/9qrbw93ddDH97QXC8SFRWgXvpOdngYyMqNYmoVsVhb0Y0bu3IYE7LrC5Hxvp4QQpk0iqalO5zlDdHPCpvjti5oMhRQc9Jrl0/hirdZtwpUcJSoUa7OhGt2XHMjTkJsJSrWRvtQ/t6Q9IPJl+45tnTsj60sil85bz3nNSytp0uQ706HoP6bPysioVZm4TR/XkYO6BjPlqdh668JDRnxmFQr2Z92xvLpA6Qw3NPzjd6Rql9ZChKgdOgxQlFFOxVuVNgnm7fuxU/KqLwxKCF4etUL50hxwXYxI5zC4NzcKFScM11u3AmV442dQJsezQ+4Vw+sl+L+99lojFXzsa6a41N8BCfXIPNzn2ykOhxUoDVylgWkZas+DnhXE6X+okhHwZVjPTJFjjTvDOEr0vYoJGxQ0H31pifgEJVLviKHDbWx2U+7ivjSEdP5ORSQgO2NuxTxvoNNuZ2aMjWROxXxTENKW2byCXMA5DUSon0dB/Ced0mDFVqZpzasTmc36PBxfxkdOiScan3iK8sU+M/IEv23iL00i1Lj0F/aSZ+LdzsN2CPbhP+KMtkYx8NmwLfh7xALg85zHA8vQVe7Jh5B57R49b2LWjMiPYb8HR6NG5uV6CtqXyWRwX5bV6Az54/BLXXkNNCpKUS3UWbca9EiQvapDnh6IV9v0SF7sIUkNbKxQGkSzw8eglPnz8EjeSMpbAT1O3T4lDaRlwpToVJk4i/a/K9wJ7V5KMtJwHXtqWiNjUKx/dp2VifjwiBGP2PoEgO+vxSuhdt7UiN3YAHpVkY0KvRpIxBc1YcLuqSWdqj995PqliWj2mftLgoNmY2TV4kBr8BR/p3lwlW7wTv8voGPT49fBLJmdlQpqWgPjeFRc1SkcNOLC3TOpUiBUnpWxB+4DgaTs+y/14vcZxfcBN9csVknxzUxYFaSTGVNhMhPXcR0nuPeeS3pSjYuB6VGhkqt8pZObLcMNW+9pQJWTr1LHDcuN3euswvwMk+ud4F6OzXe4ldv3kCG3bvnZo8pPceQk8R5BdPA+QVZSPklztT7WuazIgsrcDV68cD33+4vWn5iz5Z0/hthdk23PzKU+ybnblYzd2YnrylF+urv0eXeTranZ0H8Xn10emP6LmL1Q0ctpdopQFF05qghRj9h3AX+tN6DvKC/KlJQxjgJSjysmkU3CPC6twB1xivIKlQxzRmwpGzQQu1wccdH9FHpUus7lgJYpPlyCzSYItChrCTRoTVtaL28A6vqNC60MbzCGvsZH3pmJhkGdNwOxji0Kjxg6BAzCp0rHM9+e8+aJpKVfTaSMtRIqGwEP0DLV6AtC6hoACKHOXUFUPHUo1/U9vLoaHGjZM3ZF8GBMggRS5D6r+ku+coigszfJ5O2kb7SByKSatA0incixvyV7gaP79/EV+RdF9ul//FSz+ffLYJRLQIXIRLd1HgXEZ/cHiRtM6eEbjZvDngPeePWR1kLX0e8QI3PieUwI3TvhaxY/UbAyo/u+4H6p71dnvrMvoS5kXuwGtgcpk6K4ukxiZy8X5niIAAW9Z9Rf2NT7RkSxb037N/ADXXSMgZW/5JAAAAAElFTkSuQmCC">
              </svg>
                <span class="ml-4">클래스 장인 관리</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path }/admin/QnA.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  
                 <img style="width:35px;height:33px;" src="data:image/png;base64,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">
                </svg>
                <span class="ml-4">1:1답변</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path }/admin/QnAAll.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACMAAAAjCAYAAAAe2bNZAAAACXBIWXMAAAsTAAALEwEAmpwYAAAEYklEQVR4nO1XXUxbZRhuSNym0yxGSYpeeLMrEy+IXhkBt8R4Y7wQG4ExNxNoh4CTDUdwg9LTH8pPKWUtv4P2OzANbGORRJwrf24Sl1nmwtAlVTgHHEGFFbiYQs/Bx3xnSAY77TntvJMneXNy/t7znOf9+d5Po9nGNh7G78OJT4b8T+/R/JdAsD0xPEXSRJ49IPJsPj3Sc8yefVbu+aXL2ldCQ9q0Zb82tDygvbfofy750QjM9Dwu8qRQ5MgVgSOiyLPYauvXvxF5tgCcd9dmQklvLg8kQTK/9lDcRMQpckjg2Rk5ApFM4NlpkScHN37GqElY8ieVLvuTLOjfuzN2NSZ6dgg86YiFhIxaXQ+qBI0xYTE1PbYwIejaKfLskIxzfM2WwmHWw8zoYbIeAcMYYGf0aLXn4Y8bjQ+T4sgg/THqdylNtzeUkv7X/KtvPxX54xpjwsJr6UWzL7/1BD0XOLZ1q9M/gx2oPnkYrr4qkFusZI3DbjDNJai9YEPteRsYiwHfXWTkwubb+NaLOolYRMy9kb37bmr64MJ+3fPiNPu+nORucy5aRpslEp4BFxiTHjUWg6SQZ8iFtmutsHScgsmWh9nv3TJh82XHFh7Ou+t+8m12NP9DE6x1RyUi7v46eJgcrPzile6tTPpw2pQjEaT3bb4yNFce2UzkzgWIv/bO0apUTUak5SujCs0Te1cFPIMuVJz8AOEp36b7q5M+WMwGiYypuQQ1Zv1mHzOf3zeezVdPhmOvypH5ecSBc41Fko2er5CtHCuj3yDjsBgiVdiIuhAF2xMjNTQl62s/gfpzNrRfPwOj5xO02LeE6YHGiDvkGUUyAufbFw+R3tZi1LR9io6xDpRWFaKcMWAu4In4PF06VISIZMXY0OCtzYejqwLuy/UocxZJlfRtryn6u1xnpjIZni3YSDYVZM66jqKht1LqNTQ0xtLDmLxSp+bdAhXKdGau/eYH8DfW5vqjOqR9xFxTKCVs+elimIw5CI23qFOVYzNU5Ezn6+JMN9YWbyqq0+35GC1Xm+C94YXRXYxOZ6Hq8IanfKmKZPDjsWQh6FhT49BtyYWzrxrOL6pQ7jqGa70VavNMUKwm3MzeHQ5khISxTAi3jYpOp0frEbjIbNjirVaVypBhZVUCuj3hscx7lIz4U1nM5a3aOPKhRg1Wr2cki4EDOQLvnVmZOB7VKVWiwaJHtVmPLtdHUpkrhohnOTqaaGKByJODSo5d5lzUdFtxylkEpukELpFSNapkaeKBwJGWaI6r1xdF3ziBseE4misNCqoQLyYU5phIwETPDjqhRXJOnIVo6KuG/TMTyq15GL9kj6bIgBDI3h8ey1gAjAlxExI4ciZCieJLbwkabQaMf1UZrZTbqB8E9I+tBrJe0jwqRN6XLTdwKYSFjztH5BDa984L/86rdAJc37CNRN83kWFavjFXjSKZlHdv303Rvbf1Ot050pa+vsrn02N4ujNF1ZwSL+ajbSe28X/EPxU6o2DdubC3AAAAAElFTkSuQmCC">
                </svg>
                <span class="ml-4">문의 관리</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path }/admin/refund.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                <img style="width:35px;height:35px;"style="background-color:white;border-radius:50%;"src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACMAAAAjCAYAAAAe2bNZAAAACXBIWXMAAAsTAAALEwEAmpwYAAAGcklEQVR4nNWXe2yTVRTA7/dau/Zrt7brto61Xd+vb+3KZOvco3t3L8ZgbLCNsQdEhECCyGtEgkbEKcgERUDBIRhC0IhIMERQIgTwFeQf/QeNJIZIAgjiKGOlPeYWNtuugzkGxJOctLm995zf7nndIfR/F3MN59bmGfYpbCm/xqVK+oQydkAgEfjYBHZApk24mupUndMXml/nZmYnPTIIY6l1hUQl+4sgCZCqZdfV2ZovdW7jdrxuKec69SXWtZpc/V4MI5AKfTSPhhR76s/p1RMzxw3CUsnVybTyKzyW79c8rT/A1XDm0ZyzVdpmKLiUX2geHVBmpp2xT7UnPhSIsci8geEzAeWktFOOBseEsdiwVqRPl2kSrokV8V57rT17TCDqbO3RGEFMwFxm7RqTgVCgBmtMqlP5I1/E91s8ttb/dFhXYNyFD1qr7BVoHEWba/iIL471j/qGLB7uWRxnU7l1EUIIx3nmOKoR35BYEed9YA5ZG6wsLlVtvmH3vaVCkiJ9Uo38xsMqI4i5jRBarG5z83EO4Ty8LwyuFrEizut2u+lBGIFU2Ddr9xyY/Ep9UFt2dULrnrmj0imvTg+embmjDZSZai+GwUbNVfZpuPRHDBe+Nh7L85vKLUtDloMwjVtbASEEDJ+BqW80hjksW1kF1goO8uYXQuvucBhBvAAIgoDSpZVhMFhw2eM+FBVGX2DcJkoS34pYDoNp3tkRDtJVDUIhDxY15YAiOQ6yZrmG3Y5ILo4KY/VYm3BuRs2dRGPyRdWktJPRYLDRQZDZyyohhqGgfWU1cNV2mN+YDVe/fgG2dNVCmj0VOjc3B3+vb7oL1vJ+J+AwR8JgEUiEPkORpXsYTIyQFzBXpLdFg5m5rQ0EEiE09bbD7N4O6NjcHPwsWFQCiXIRbFpeA+lmBWTUOWH2rs7g7+3vtQdhEvVJ4FlVExUm1ak8h6srzKO1ypGBwxBluBWGhkmqlEH9m01hYXB15ILWqYKMqROhuTc8jEmGZKBoKmqYsOgKTDvwcA3ziG8Et/1h14XuwuAKKphfHFRcGaOtpsJFpcEzjW+1RIUxltsWs3IRLvmIxQR2IBoMzaMH9IUm38Mq7l+RMHg0xMYL7oTfTJltwb3NkZKGEHpxHNUValzvNj43zC/uio4pjnj0mEWTo90cr5T8PbRAkuRZiqIvYWWYmCsMw1zG3wmC+IAiiC00ReHNEE1JkrxN0+THCCHhWGDUWZpjuPkNLVAUdZ3jMiEryw0pKWrQ6iygUumCzrLSrX37etbBgXc2RNX9m7pBmZyIE3P5WGAkKukNXZ7hwzCYvLxyqKpqBJ3eCnaHCyyWDChxTbp17Yfj8CCd21DnJwiiZwR/SoTQMwihlxFCYc9P2wynhaBIcEx25D4QpqYo3xvp+LNtG6F9Ws2QTq8oHRDw+TiM3D1zeMC6EULdsXz+eZIk/A6L8Xq9p2SAIkkfQsg06Febq/9Uqk64HoYeCpPtKob8fM+IMJ+8vT5Qmpt9UyGX9REEgfsSUBR1jSSIgwxDH2Rouk8kFHqne0pu9navgQvHDw2d5Qw6PPfmYJ+u2a4JfDE/ciiHw+QXVEJxcc2IMKF66fQXcHLvDti5bjUsm9vqX71gTuD4nu3w5/dfDe25/O0xOLh1I8yaUuVnaLofN13sMy1bc0qmlV8eFtSwMOn+DZMnzzWqnInU308cBnwr08qL7wgFsQOSOPFFSby4ZxDE4rGtwm9rroqrvi9McUktlJbVBWFwCGx6ze2eVc/DH6eO3Bfg/NEDsPWlLih2TepnaNoXL2LPMwyzFvsO9WWfNtHDE/EDUSc1FpKkrkml8v7ExBTvoLKseIAkyaMkSS5kBYLfxKzw1pKOlsBPn+8fAjizvxdWL5gL6SZdP8PQvuQE2RmGYXDlRH3bclMc8/BjXO3SHkH3kYUIoRVRtDZkjzuOZQ/jvzp3osObkijv5/NivDKJ5BBCqB4hxI5kvKGhgTIUmffg0OgLTe+icRQFQqgTIVRyr4yDwtVluNNc2tNoDSJDN3N1ziXxSslNUZL4tsnDzUOPWrgaZ45AJvSpMtXfGTONCVytoyMtR3dClCTux29qTZ5+v6vBFfvIQTLrMnXCBBZ3YOCJ+H6c9PgzxZ56wVrtWO9ucz/e4avK0pwlaTJgcJteM0+1D3biJyfKp9Tf4P+3InPmiYm+wOJ8GAP/AOM+uAJCAajYAAAAAElFTkSuQmCC">
               </svg>
                <span class="ml-4">환불관리</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path }/admin/product.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAACXBIWXMAAAsTAAALEwEAmpwYAAAEP0lEQVR4nO2X709TVxjHm2Vv3V5skR8v9+N/2C+GS4oadQmOlrUKRmphC9WsDmUTGWzo6AQLhdYu2wR8MeNErYjlnEpvsxdmziFk/gHGzMm9rfScCx2LFll8lnPwYi299ba9JEvGk3zTe0/vfc7nPs9zfhkMa7Zm/1NLhEtfgnbDc4lIaV1CKHbNXylar3snshx+cZoii0iRTyQYiRT/ykUwkijyTtOxDwlBL2QGLNo2K5RsTwglwBUuGdYNTJKD74oEYYngBYliyCqCFzi8jMvS/cyFS43LgELJ2YLB7s6Mvy4SdPmZUFRN6NK9OfRqqs+EULQ7IRR3FpxikaCNEsGz+cNhLpHiRFQObUv3f3y0/OX2n8ufzwtOoqhBJPifQuEkBZKgRZGO1af24QoY77oCxra8Iscc6gUnLUOyD0ZblH6OXdxU1jVcXpxzzemRVkl9AMnpNZlr9IKKM8cHG8HfUq+LGisruM+YHIEoDV3KD07GZalf6222wf3JH3WRt9nGfd5fkID+NQHRON6QT/TwagNKT+pxLOcVIn0SXk1AieCk2oqTOXoUW9MLustZqxtgl7N2xYCJUlydAyDypTsY8ByEI3uqoM9Zm5N6HTuhu94MPY07+D3zMdR/INMq06cdkC/2Tzu4fn0AvE11EPm2VVXBnoMr2vw1Jrj6xmbo37qF3zMfExMDmeZF7XUoEXQtJgsgz/8OEg1pBnTv3bGizWOpBHf5e+DabMwKKBH0S06Afz+4DcyWIJ8A9jt3PR213mbwftEE50/2wbmTHv575kQXDLY5+P+nDjXAuK8FBj6z6wfIUjwzdxXmH9wGFslUwB7HzhWA/q+aIXDKv6yz3/XC0Jf7MkZZPcUoqD2CFHnValABFPyHudh12NeSNfWKTnc41CNIkUcz4Oytr48ScTArYIetCo7YTDDqPgC1G96E8ROHIfIYWE2sPLKk2KQJbmHKWrc4ZQUmesenCnjUbuI607EX9m/fBCPdn4JnX01WwCveQ5kBCU7G4yPrNAEuTlk7FcDErU5VQJau0x1LA0FpyzSKU8WeywSYU/3BzZr1D6csw8mbdUJ0JvAoEyCLxPFGKxeDOvaxhcPmDUjH3jbkY+wMoTiZuDHInXv374LznU7N82Dksc65PuHvept2w43JoRQ4dMGQr/15L/Qa21QyR39Io9BuN4Pgb4UfPrdzGHeavvmoOmM7E3uHgbbVm+BOdFQZGDQ2F3zFUIiJJFShbPnRSDe0NZih1VaVl9obqiEUdC9v+WOxnyoXJy1bCwLkkBTb9TyXiOzQRNAeBvdw0voIfjPndhZRi6SS7oJEEJ0m2Kj41QVOMXbAkSgaKQAwUHDNaTFRRu+w7ZFEcPLZEcNJ9uw0Db21akCuCxXfM6W3x+Mj69hOWKK4fwkYXWPi1xT1RSk2a14hCgK8WPE+06p3tGZrZvjv2b+fZCs2/6ddaQAAAABJRU5ErkJggg==">
                </svg>
                <span style="margin-left:10px;"class="ml-4">상품관리</span>
              </a>
            </li>
            
        </div>
      </aside>


      <div class="flex flex-col flex-1 w-full">
        <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
          <div
            style="width:fit-content;margin-right:0"
            class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300"
          >
            <ul class="flex items-center flex-shrink-0 space-x-6">
              <!-- Theme toggler -->
              <li class="flex">
                <button
                  class="rounded-md focus:outline-none focus:shadow-outline-purple"
                  @click="toggleTheme"
                  aria-label="Toggle color mode"
                >
                  <template x-if="!dark">
                    <svg
                      class="w-5 h-5"
                      aria-hidden="true"
                      fill="currentColor"
                      viewBox="0 0 20 20"
                    >
                      <path
                        d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"
                      ></path>
                    </svg>
                  </template>
                  <template x-if="dark">
                    <svg
                      class="w-5 h-5"
                      aria-hidden="true"
                      fill="currentColor"
                      viewBox="0 0 20 20"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
                        clip-rule="evenodd"
                      ></path>
                    </svg>
                  </template>
                </button>
              </li>
              
              <li class="flex">
              <a href="${path }"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAADC0lEQVR4nO2WXUiTURjHDzWjiy6LIi+km6CbLoqCYEQRRYSCjGYqY/ah1ObH1GxqOTdrOsu2kjQIGyzMMM2iWKskXNZmY1A6Lbecq5hufVC+73veiCDtH+9q9p3DyLrYH35X5zz8Dg+Hcx5CphEAsxiGWcFxXAml1DY2NtYbCoUyyd8Ix3FLKaUKjuMucBz3mlIKgQcDw+j3DIFhmPcKhWLZtAUA5vA8v4HneSnHcTsppRaWZUejosBwEBfb7dCWnoQ0uRRZkv1QF52MrHV3dzcKdQKUUgnDMEtilSZQSl1RicDoyHPYrD0w1jQjO7MK6SmlOFqggd2ow5tLBnjPNUyKv4dl2XG3271jSjHLsquEguO1zdiRpoFMUgFZahmMqkrcMunAdhiAa4e/wdtsxOb1xdgu1URqomRn6OAbfAyv1+smhMz7rZjn+XWCWJl1CB35MngttT+Ivodpr0bjzu2wFsrQrc6cpCBNBecdD/x+fz8hJDFmcVdJBsJtR6YUh8/XoTjnGGrUp2HSnIlg1+ZBnVn4d8UjrSZk5TQjd991FFbcimCrVMfFifFWT/tyvbf+g8v1orUGG8UqeM36mRU/Muuxbk0BnPVVMysetnwSu07MsHjCVgtrdSXeXamNPyCIP5n++O/0X/3HlNK1gjh/lwF50mIcyK7EeZ0WfoseE7afi72WOkiStdiWehAZEn2EvPQySDbthatnAENDQzGJF7As+/bpk1H03vPhbk8/zKcuQ5VzGFu3lEK7R4fLei1GzlZ/EZ9rQG6OKbL/G+77hCkTdru9gxCyiEwVp9OZ3NfX1+XxeByBQOAhwzDjQhdevXoNx+1eNNa3Ybdcj/SUMhjydTBraibHW5/P1yfURens7GxNSkraTAgRkRgz9/MpF4vF4uVNTU1FDoejIxgMBliW/SBInj97iZs33DAaWmAxX42I5XK5XKj5igWEkNmxSn+VWYSQ+VKpdE1LS4vG5XJdC4fDoejwPjg46E5ISFj5p5JYIrRvoVKp3FBeXr5LJBKt/typmPIRW0XTSiwMybkAAAAASUVORK5CYII=">
              </a>
                </li>
              
                  </ul>
                </template>
              </li>
            </ul>
          </div>
        </header>
        <main class="h-full overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              ADMIN HOME
            </h2>
            <!-- CTA -->
            <a
              class="flex items-center justify-between p-4 mb-8 text-sm font-semibold text-purple-100 bg-purple-600 rounded-lg shadow-md focus:outline-none focus:shadow-outline-purple"
              href="${path }/admin/QnA.do"
            >
              <div class="flex items-center">
                <svg
                  class="w-5 h-5 mr-2"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"
                  ></path>
                </svg>
                <span>매일 1:1 문의 답변 꼭!!</span>
              </div>
              <span>바로 이동 &RightArrow;</span>
            </a>
            <!-- Cards -->
            <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-orange-500 bg-orange-100 rounded-full dark:text-orange-100 dark:bg-orange-500"
                >
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                      d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z"
                    ></path>
                  </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    Members
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    <span class="numberCount1">600</span>
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-green-500 bg-green-100 rounded-full dark:text-green-100 dark:bg-green-500"
                >
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z"/>
                  <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z"/>
                  <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z"/>
                  <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z"/>
                </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                  Profit
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    $<span class="numberCount2">2000</span>
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full dark:text-blue-100 dark:bg-blue-500"
                >
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                      d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"
                    ></path>
                  </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                   Total sales
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                  <span class="numberCount3">376</span>
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-teal-500 bg-teal-100 rounded-full dark:text-teal-100 dark:bg-teal-500"
                >
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-badge-fill" viewBox="0 0 16 16">
                  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2zm4.5 0a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3zM8 11a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm5 2.755C12.146 12.825 10.623 12 8 12s-4.146.826-5 1.755V14a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-.245z"/>
                </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    Employee
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                  <span class="numberCount4">0</span><span class="numberCount5"></span>
                  </p>
                </div>
              </div>
            </div>

            <script>
              $(function() {
                    var cnt0 = 0;
                    var cnt1 = 0;
                    var cnt2 = 0;
                    var cnt3 = 0;

                    counterFn1();
                    counterFn2();
                    counterFn3();
                    counterFn4();
                    const numberCount1=document.querySelector(".numberCount1").innerHTML;
                    const numberCount2=document.querySelector(".numberCount2").innerHTML;
                    const numberCount3=document.querySelector(".numberCount3").innerHTML;
                    const numberCount4=document.querySelector(".numberCount4").innerHTML;
                    console.log(numberCount1+numberCount2+numberCount3+numberCount4);
                    
                    //회원수
                    function counterFn1() {
                      id0 = setInterval(count0Fn, 0.00000001);
                      function count0Fn() {
                        cnt0++;
                        if (cnt0 > numberCount1) {
                          clearInterval(id0);
                        } else {
                          $(".numberCount1").text(cnt0);
                        }
                      }
                    }
                    //매출액
                      function counterFn2() {
                      id1 = setInterval(count0Fn, 0.000000000001);
                      function count0Fn() {
                        cnt1++;
                        if (cnt1 > numberCount2) {
                          clearInterval(id1);
                        } else {
                          $(".numberCount2").text(cnt1);
                        }
                      }
                    }
                    //판매량
                      function counterFn3() {
                      id2 = setInterval(count0Fn, 0.0000001);
                      function count0Fn() {
                        cnt2++;
                        if (cnt2 > numberCount3) {
                          clearInterval(id2);
                        } else {
                          $(".numberCount3").text(cnt2);
                        }
                      }
                    }
                    //사원수
                      function counterFn4() {
                      id3 = setInterval(count0Fn, 1000);
                      function count0Fn() {
                        cnt3++;
                        if (cnt3 > 6) {
                          clearInterval(id3);
                        } else {
                          $(".numberCount4").text(cnt3);
                        }
                      }
                      $(".numberCount5").text("+");
                    }

                  });
              </script>
           

            <!-- Charts -->
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
            STATISTICS
            </h2>
            <div class="grid gap-6 mb-8 md:grid-cols-2">
              <div
                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                  Sales
                </h4>
                <canvas id="pie"></canvas>
                <div
                  class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                >
                  <!-- Chart legend -->
                  <div class="flex items-center">
                    <span
                      class="inline-block w-3 h-3 mr-1 bg-blue-500 rounded-full"
                    ></span>
                    <span>Shirts</span>
                  </div>
                  <div class="flex items-center">
                    <span
                      class="inline-block w-3 h-3 mr-1 bg-teal-600 rounded-full"
                    ></span>
                    <span>Shoes</span>
                  </div>
                  <div class="flex items-center">
                    <span
                      class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"
                    ></span>
                    <span>Bags</span>
                  </div>
                </div>
              </div>
              <div
                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                  Profit
                </h4>
                <canvas id="line"></canvas>
                <div
                  class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                >
                  <!-- Chart legend -->
                  <div class="flex items-center">
                    <span
                      class="inline-block w-3 h-3 mr-1 bg-teal-600 rounded-full"
                    ></span>
                    <span>2022</span>
                  </div>
                  <div class="flex items-center">
                    <span
                      class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"
                    ></span>
                    <span>2023</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
  </body>

  

</html>
    