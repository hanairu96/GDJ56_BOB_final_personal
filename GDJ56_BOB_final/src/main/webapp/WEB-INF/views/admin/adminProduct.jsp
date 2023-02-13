<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ADMIN-상품관리</title>
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
  </head>
  <body>
    <div
      class="flex h-screen bg-gray-50 dark:bg-gray-900"
      :class="{ 'overflow-hidden': isSideMenuOpen}"
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
            <span style="color: #707275;" class="ml-4">HOME</span>
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
            <img src="data:image/png;base64,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">
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
            <span class="ml-4">1:1 답변</span>
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
            <img style="width:35px;height:35px;"style="background-color:white;border-radius:50%;"src="data:image/png;base64,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">
           </svg>
            <span class="ml-4">환불관리</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
          <span
            class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
            aria-hidden="true"
          ></span>
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
            <span style="margin-left:10px;color:#1A1C23"class="ml-4">상품관리</span>
          </a>
        </li>
        
    </div>
  </aside>
      <div class="flex flex-col flex-1">
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
              <!-- 나가는문 -->
              <a href="${path }">
              	<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAADC0lEQVR4nO2WXUiTURjHDzWjiy6LIi+km6CbLoqCYEQRRYSCjGYqY/ah1ObH1GxqOTdrOsu2kjQIGyzMMM2iWKskXNZmY1A6Lbecq5hufVC+73veiCDtH+9q9p3DyLrYH35X5zz8Dg+Hcx5CphEAsxiGWcFxXAml1DY2NtYbCoUyyd8Ix3FLKaUKjuMucBz3mlIKgQcDw+j3DIFhmPcKhWLZtAUA5vA8v4HneSnHcTsppRaWZUejosBwEBfb7dCWnoQ0uRRZkv1QF52MrHV3dzcKdQKUUgnDMEtilSZQSl1RicDoyHPYrD0w1jQjO7MK6SmlOFqggd2ow5tLBnjPNUyKv4dl2XG3271jSjHLsquEguO1zdiRpoFMUgFZahmMqkrcMunAdhiAa4e/wdtsxOb1xdgu1URqomRn6OAbfAyv1+smhMz7rZjn+XWCWJl1CB35MngttT+Ivodpr0bjzu2wFsrQrc6cpCBNBecdD/x+fz8hJDFmcVdJBsJtR6YUh8/XoTjnGGrUp2HSnIlg1+ZBnVn4d8UjrSZk5TQjd991FFbcimCrVMfFifFWT/tyvbf+g8v1orUGG8UqeM36mRU/Muuxbk0BnPVVMysetnwSu07MsHjCVgtrdSXeXamNPyCIP5n++O/0X/3HlNK1gjh/lwF50mIcyK7EeZ0WfoseE7afi72WOkiStdiWehAZEn2EvPQySDbthatnAENDQzGJF7As+/bpk1H03vPhbk8/zKcuQ5VzGFu3lEK7R4fLei1GzlZ/EZ9rQG6OKbL/G+77hCkTdru9gxCyiEwVp9OZ3NfX1+XxeByBQOAhwzDjQhdevXoNx+1eNNa3Ybdcj/SUMhjydTBraibHW5/P1yfURens7GxNSkraTAgRkRgz9/MpF4vF4uVNTU1FDoejIxgMBliW/SBInj97iZs33DAaWmAxX42I5XK5XKj5igWEkNmxSn+VWYSQ+VKpdE1LS4vG5XJdC4fDoejwPjg46E5ISFj5p5JYIrRvoVKp3FBeXr5LJBKt/typmPIRW0XTSiwMybkAAAAASUVORK5CYII=">
              </a>
              </li>
              
                  </ul>
                </template>
              </li>
            </ul>
          </div>
        </header>
        <main class="h-full pb-16 overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <div style="display: flex; flex-direction: row;">
               <h4
                style="font-size: 15px; color: purple; border: 2px solid purple; border-radius:10px; padding: 10px;"
                class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
              >
                상품 관리
              </h4>
              <!-- 검색창 -->
				<div id="searchbox"  class="flex justify-center flex-1 lg:mr-32" style="align-items:center;text-align:center;" >
						
					<form action="${path }/admin/productSearch.do" method="post" onsubmit="return checkIt();">
						<select name="searchlist"
							id="searchselect"
							style="padding: 0.3%; margin: 1%;width:100px; 
							border:1px solid purple;margin-left:-6%;color:purple;height:35px;text-align:center;"
							class="text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input">
							  <option value="searchNo">검색 ▼</option>
		                      <option value="ITEM_NAME">제품명</option>
		                      <option value="ITEM_STOCK">재고량</option>
							<input 
								id="searchclass" 
								style="height:35px;width:220px;border:1px solid purple;margin-left:15px;margin-right:15px;"
				                class="w-full pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input"
								type="text" name="search" placeholder="Search for product"/>
							<button class="search-btn" style="height:35px;margin-top:4px;">
							 <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
				                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				             </svg>
							</button>
						</select>
						<input type="hidden" name="cpage" value="1">
						<input type="hidden" name="numPerpage" value="5">
					</form>
					<script>
						const checkIt=()=>{
							if(document.querySelector("#searchclass").value==""){
								alert("검색할 내용을 입력하세요 :(");
								return false;
							}
							
							if(document.querySelector("#searchselect").value=="ITEM_STOCK"){
								const notNumber = /^[0-9]+$/;
								
						        if (!notNumber.test(document.querySelector("#searchclass").value)) {
						        	alert("숫자만 입력해주세요 :(");
						        	return false;
						        } 
							} 	
						}
					</script>
					
				</div>
            </div>
             <!-- New Table -->
             <div class="w-full overflow-hidden rounded-lg shadow-xs">
              <div class="w-full overflow-x-auto">
               <div style="display:flex;justify-content:space-between;align-items:center;">
		          	<p>총 <b>${totalData }개</b>의 상품이 있습니다</p>
	        	</div>
                <table class="w-full whitespace-no-wrap" style="text-align:center;table-layout:fixed;">
                  <c:if test="${empty list }">
                   		<thead>
			            	<tr>
			            		<td colspan="8">등록된 상품이 없습니다 :(</td>
			            	</tr>
			            </thead>
		            </c:if>
		            <c:if test="${not empty list }">
                  <thead>
                    <tr
                    style="text-align:center;"
                       class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3">상품사진</th>
                      <th class="px-4 py-3">브랜드</th>
                      <th class="px-4 py-3">제품명</th>
                      <th class="px-4 py-3">가격</th>
                      <th class="px-4 py-3">원산지</th>
                      <th class="px-4 py-3">등록일</th>
                      <th class="px-4 py-3">재고량</th>
                      <th class="px-4 py-3">관리</th>
                    </tr>
                  </thead>
                  <tbody
	                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
	                  >
	                  	<c:forEach var="m" items="${list }" >
		                    <tr class="text-gray-700 dark:text-gray-400">
	                      <td class="px-4 py-3 text-xs">
	                      <img 
	                        id="imgClick"
	                      	onclick="location.assign('${path}/market1/marketdetail.do?itemNo=${m.itemNo }');"
	                      	style="width:120px;height:120px;" src="${path }/resources/upload/market/mainlabel/${m.mainPic}">
	                      </td>
	                      <td class="px-4 py-3 text-xs" style="width:10px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
	                        ${m.itemBrand}
	                      </td>
	                      <td class="px-4 py-3 text-sm" style="width:20px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
	                        ${m.itemName}
	                      </td>
	                      <td class="px-4 py-3 text-sm" >
	                        ${m.itemPrice}
	                      </td>
	                      <td class="px-4 py-3 text-sm" style="width:10px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
	                       ${m.madeIn }
	                      </td>
	                      <td class="px-4 py-3 text-sm" >
	                        ${m.itemEnroll}
	                      </td>
	                      <td class="px-4 py-3 text-sm">
	                       <c:if test="${m.itemStock eq 0 }">
		                        <span
		                        class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600"
		                        >
		                       ${m.itemStock }
		                       </span>
	                       </c:if>
	                       <c:if test="${m.itemStock ne 0 }">
		                        ${m.itemStock }
	                       </c:if>
	                      </td>
	                      <td class="px-4 py-3 text-sm">
	                        <button
	                        onclick="location.assign('${path}/market1/updateItemGo.do?itemNo=${m.itemNo }');"
	                        style="width:fit-content;background-color: white; border: 1.5px solid purple; color: purple;"
	                        class="modal_close_btn px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
	                      >상품정보수정</button>
	                      </td>
	                    </tr>
					  </c:forEach>
					</tbody>
				  </c:if>
                </table>
              </div>
              <div
                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
              >
                <span class="col-span-2"></span>
                <!-- Pagination -->
                <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-center">
                  <nav aria-label="Table navigation">
                    ${pageBar}
                  </nav>
                </span>
              </div>
            </div>
            </div>
		<style>
			#imgClick{
				cursor:pointer;
			}
		</style>

        </main>
      </div>
    </div>
  </body>
</html>