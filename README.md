# CREATORPLATFORM.XYZ
- https://creatorplatform.xyz/
- https://www.youtube.com/watch?v=MwbmKqdDsyI&list=PLS6F722u-R6IJfBrIRx3a2SBkAL4vUp2p&index=2
- https://github.com/cjavdev/creators.dev

## New Ruby on Rails application and Static pages - CreatorPlatform.xyz - Part 2
- rails new creators -c tailwind -j esbuild -d postgresql -T --main
- tailwind didnt install for me with this so i
```
- https://tailwindcss.com/docs/guides/ruby-on-rails
bundle add tailwindcss-rails
rails tailwindcss:install
- explanation of bin/dev here
https://www.nickhammond.com/learning-to-love-bin-slash-dev-in-rails-7/
```
- add to layout app:

```
<%= stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload" %>
```
- rails g controller StaticPages root
- update routes

```
root 'static_pages#root'
```

- for postgresql
- rails db:create
- rails db:migrate

## Devise authentication styled with Tailwind UI - Creator Platform.xyz - Part 3
- bundle add devise
- rails g devise:install
- do the rails mailer; notices; views
- rails g model User
- rails db:migrate
- rails g devise User
- in the migration, make the users trackable
- rails db:migrate
- updated the devise new registration and new sessions with tailwind
- devise with turbo
- https://dev.to/efocoder/how-to-use-devise-with-turbo-in-rails-7-9n9
- create a new user
- update layouts/app html and body tags

```
<html class="h-full">
<body class="h-full">
```

## Landing page for Ruby on Rails with Tailwind UI - CreatorPlatform.xyz - Part 4
- update tailwind.config.js

```
- up top
const colors = require('tailwindcss/colors')
....

  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        teal: colors.teal,
        cyan: colors.cyan,
      },
    },
  },
```

- update static pages/root

```
<div class="bg-white">
  <div class="relative overflow-hidden">
    <header class="relative">
      <div class="bg-gray-900 pt-6">
        <nav class="relative max-w-7xl mx-auto flex items-center justify-between px-4 sm:px-6" aria-label="Global">
          <div class="flex items-center flex-1">
            <div class="flex items-center justify-between w-full md:w-auto">
              <a href="/">
                <span class="sr-only">CreatorPlatform.xyz</span>
                <img class="h-8 w-auto sm:h-10" src="<%#= image_path('logo.png') %>" alt="">
              </a>
              <div class="-mr-2 flex items-center md:hidden">
                <button type="button" class="bg-gray-900 rounded-md p-2 inline-flex items-center justify-center text-gray-400 hover:bg-gray-800 focus:outline-none focus:ring-2 focus-ring-inset focus:ring-white" aria-expanded="false">
                  <span class="sr-only">Open main menu</span>
                  <!-- Heroicon name: outline/menu -->
                  <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
                  </svg>
                </button>
              </div>
            </div>
            <div class="hidden space-x-8 md:flex md:ml-10">
              <a href="/dashboard" class="text-base font-medium text-white hover:text-gray-300">Dashboard</a>
            </div>
          </div>
          <div class="hidden md:flex md:items-center md:space-x-6">
            <% if user_signed_in? %>
              <span class="text-white"><%= current_user.email %></span>
              <!-- <a href="/users/sign_out" class="inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md text-white bg-gray-600 hover:bg-gray-700">Sign out</a> -->
               <%= button_to "Sign out", destroy_user_session_path, method: :delete, class: "inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md text-white bg-gray-600 hover:bg-gray-700" %>
            <% else %>
            <a href="/users/sign_in" class="text-base font-medium text-white hover:text-gray-300"> Log in </a>
            <a href="/users/sign_up" class="inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md text-white bg-gray-600 hover:bg-gray-700">
              Register
            </a>
            <% end %>
          </div>
        </nav>
      </div>

      <!--
        Mobile menu, show/hide based on menu open state.

        Entering: "duration-150 ease-out"
          From: "opacity-0 scale-95"
          To: "opacity-100 scale-100"
        Leaving: "duration-100 ease-in"
          From: "opacity-100 scale-100"
          To: "opacity-0 scale-95"
      -->
      <div class="absolute top-0 inset-x-0 p-2 transition transform origin-top md:hidden">
        <div class="rounded-lg shadow-md bg-white ring-1 ring-black ring-opacity-5 overflow-hidden">
          <div class="px-5 pt-4 flex items-center justify-between">
            <div>
              <img class="h-8 w-auto" src="" alt="">
            </div>
            <div class="-mr-2">
              <button type="button" class="bg-white rounded-md p-2 inline-flex items-center justify-center text-gray-400 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-blue-600">
                <span class="sr-only">Close menu</span>
                <!-- Heroicon name: outline/x -->
                <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>
          </div>
          <div class="pt-5 pb-6">
            <div class="px-2 space-y-1">
              <a href="/dashboard" class="block px-3 py-2 rounded-md text-base font-medium text-gray-900 hover:bg-gray-50">Dashboard</a>
            </div>
            <div class="mt-6 px-5">
              <a href="/users/sign_up" class="block text-center w-full py-3 px-4 rounded-md shadow bg-gradient-to-r from-teal-500 to-blue-600 text-white font-medium hover:from-teal-600 hover:to-blue-700">Sign up</a>
            </div>
            <div class="mt-6 px-5">
              <p class="text-center text-base font-medium text-gray-500">Existing customer? <a href="/users/sign_in" class="text-gray-900 hover:underline">Login</a></p>
            </div>
          </div>
        </div>
      </div>
    </header>
    <main>
      <div class="pt-10 bg-gray-900 sm:pt-16 lg:pt-8 lg:pb-14 lg:overflow-hidden">
        <div class="mx-auto max-w-7xl lg:px-8">
          <div class="lg:grid lg:grid-cols-2 lg:gap-8">
            <div class="mx-auto max-w-md px-4 sm:max-w-2xl sm:px-6 sm:text-center lg:px-0 lg:text-left lg:flex lg:items-center">
              <div class="lg:py-24">
                <h1 class="mt-4 text-4xl tracking-tight font-extrabold text-white sm:mt-5 sm:text-6xl lg:mt-6 xl:text-6xl">
                  <span class="block">A better way to</span>
                  <span class="pb-3 block bg-clip-text text-transparent bg-gradient-to-r from-teal-200 to-blue-400 sm:pb-5">sell digital content</span>
                </h1>
                <p class="text-base text-gray-300 sm:text-xl lg:text-lg xl:text-xl">For digital creators of all sizes.</p>
                <div class="mt-10 sm:mt-12">
                  <% if !user_signed_in? %>
                    <form action="#" class="sm:max-w-xl sm:mx-auto lg:mx-0">
                      <div class="sm:flex">
                        <div class="min-w-0 flex-1">
                          <label for="email" class="sr-only">Email address</label>
                          <input id="email" type="email" placeholder="Enter your email" class="block w-full px-4 py-3 rounded-md border-0 text-base text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-400 focus:ring-offset-gray-900">
                        </div>
                        <div class="mt-3 sm:mt-0 sm:ml-3">
                          <button type="submit" class="block w-full py-3 px-4 rounded-md shadow bg-gradient-to-r from-teal-500 to-blue-600 text-white font-medium hover:from-teal-600 hover:to-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-400 focus:ring-offset-gray-900">Start free trial</button>
                        </div>
                      </div>
                      <p class="mt-3 text-sm text-gray-300 sm:mt-4">Start your free 14-day trial, no credit card necessary. By providing your email, you agree to our <a href="#" class="font-medium text-white">terms of service</a>.</p>
                    </form>
                  <% end %>
                </div>
              </div>
            </div>
            <div class="mt-12 -mb-16 sm:-mb-48 lg:m-0 lg:relative">
              <div class="mx-auto max-w-md px-4 sm:max-w-2xl sm:px-6 lg:max-w-none lg:px-0">
                <!-- Illustration taken from Lucid Illustrations: https://lucid.pixsellz.io/ -->
                <!-- <img class="w-full lg:absolute lg:inset-y-0 lg:left-0 lg:h-full lg:w-auto lg:max-w-none" src="https://tailwindui.com/img/component-images/cloud-illustration-teal-blue.svg" alt=""> -->
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Feature section with screenshot -->
      <div class="relative bg-gray-50 pt-16 sm:pt-24 lg:pt-32">
        <div class="mx-auto max-w-md px-4 text-center sm:px-6 sm:max-w-3xl lg:px-8 lg:max-w-7xl">
          <div>
            <h2 class="text-base font-semibold tracking-wider text-blue-600 uppercase">Content</h2>
            <p class="mt-2 text-3xl font-extrabold text-gray-900 tracking-tight sm:text-4xl">Videos | Courses | E-books</p>
            <p class="mt-5 max-w-prose mx-auto text-xl text-gray-500">Get paid and easily spend your funds. No bank account needed.</p>
          </div>
          <div class="mt-12 -mb-10 sm:-mb-24 lg:-mb-20">
            <img class="rounded-lg shadow-xl ring-1 ring-black ring-opacity-5" src="<%#= image_path('dashboard.png') %>" alt="Creator platform dashboard">
          </div>
        </div>
      </div>

      <!-- Feature section with grid -->
      <div class="relative bg-white py-16 sm:py-24 lg:py-32">
        <div class="mx-auto max-w-md px-4 text-center sm:max-w-3xl sm:px-6 lg:px-8 lg:max-w-7xl">
          <h2 class="text-base font-semibold tracking-wider text-blue-600 uppercase">Sell faster</h2>
          <p class="mt-2 text-3xl font-extrabold text-gray-900 tracking-tight sm:text-4xl">Everything you need to sell your digital downloads</p>
          <p class="mt-5 max-w-prose mx-auto text-xl text-gray-500">We host your site so you don't have to.</p>
          <div class="mt-12">
            <div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/cloud-upload -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">Custom subdomains</h3>
                    <p class="mt-5 text-base text-gray-500">Sign up today to reserve your subdomain: <pre>your-store.creatorplatform.xyz</pre></p>
                  </div>
                </div>
              </div>

              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/lock-closed -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">SSL Certificates</h3>
                    <p class="mt-5 text-base text-gray-500">Qui aut temporibus nesciunt vitae dicta repellat sit dolores pariatur. Temporibus qui illum aut.</p>
                  </div>
                </div>
              </div>

              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/refresh -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">Issued cards</h3>
                    <p class="mt-5 text-base text-gray-500">Spend the money you earn with virtually issued cards.</p>
                  </div>
                </div>
              </div>

              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/shield-check -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">Advanced Security</h3>
                    <p class="mt-5 text-base text-gray-500">Ullam laboriosam est voluptatem maxime ut mollitia commodi. Et dignissimos suscipit perspiciatis.</p>
                  </div>
                </div>
              </div>

              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/cog -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                          <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">Powerful API</h3>
                    <p class="mt-5 text-base text-gray-500">Ab a facere voluptatem in quia corrupti veritatis aliquam. Veritatis labore quaerat ipsum quaerat id.</p>
                  </div>
                </div>
              </div>

              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/server -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M5 12a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v4a2 2 0 01-2 2M5 12a2 2 0 00-2 2v4a2 2 0 002 2h14a2 2 0 002-2v-4a2 2 0 00-2-2m-2-4h.01M17 16h.01" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">Customer logins</h3>
                    <p class="mt-5 text-base text-gray-500">Enable customers to login to see what they purchased from you.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <footer class="bg-gray-50" aria-labelledby="footer-heading">
      <h2 id="footer-heading" class="sr-only">Footer</h2>
      <div class="max-w-md mx-auto pt-12 px-4 sm:max-w-7xl sm:px-6 lg:pt-16 lg:px-8">
        <div class="xl:grid xl:grid-cols-3 xl:gap-8">
          <div class="space-y-8 xl:col-span-1">
            <img class="h-10" src="<%#= image_path('logo.png') %>" alt="CreatorPlatform.xyz">
            <p class="text-gray-500 text-base">The easiest way to sell your digital downloads.</p>
            <div class="flex space-x-6">
              <a href="https://twitter.com/cjav_dev" class="text-gray-400 hover:text-gray-500">
                <span class="sr-only">Twitter</span>
                <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                  <path d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84" />
                </svg>
              </a>

              <a href="https://github.com/cjavdev" class="text-gray-400 hover:text-gray-500">
                <span class="sr-only">GitHub</span>
                <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                  <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd" />
                </svg>
              </a>
            </div>
          </div>
          <div class="mt-12 grid grid-cols-2 gap-8 xl:mt-0 xl:col-span-2">
            <div class="md:grid md:grid-cols-2 md:gap-8">
              <div>
                <h3 class="text-sm font-semibold text-gray-400 tracking-wider uppercase">Solutions</h3>
                <ul role="list" class="mt-4 space-y-4">
                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Marketing </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Analytics </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Commerce </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Insights </a>
                  </li>
                </ul>
              </div>
              <div class="mt-12 md:mt-0">
                <h3 class="text-sm font-semibold text-gray-400 tracking-wider uppercase">Support</h3>
                <ul role="list" class="mt-4 space-y-4">
                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Pricing </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Documentation </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Guides </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> API Status </a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="md:grid md:grid-cols-2 md:gap-8">
              <div>
                <h3 class="text-sm font-semibold text-gray-400 tracking-wider uppercase">Company</h3>
                <ul role="list" class="mt-4 space-y-4">
                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> About </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Blog </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Jobs </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Press </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Partners </a>
                  </li>
                </ul>
              </div>
              <div class="mt-12 md:mt-0">
                <h3 class="text-sm font-semibold text-gray-400 tracking-wider uppercase">Legal</h3>
                <ul role="list" class="mt-4 space-y-4">
                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Claim </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Privacy </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Terms </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="mt-12 border-t border-gray-200 py-8">
          <p class="text-base text-gray-400 xl:text-center">&copy; 2022 CreatorPlatform.xyz, Inc. All rights reserved.</p>
        </div>
      </div>
    </footer>
  </div>
</div>

```

- refresh, it wasnt working, i restarted the server and it worked

## Postgres enums in Ruby on Rails - CreatorPlatform.xyz - Part 5
- rails g model Event data:json source processing_errors:text status:enum
- he updated the migration

```
  def change
    create_enum :status, %w[
      pending
      processing
      processed
      failed
    ]
    create_table :events do |t|
      t.json :data
      t.string :source
      t.text :processing_errors
      t.enum(
        :status,
        enum_type: 'status',
        default: 'pending',
        null: false
      )
      t.timestamps
    end
  end
end
```

- it didnt work for me, maybe ill do regular enums later, to see if this app needs them

## Handle webhooks and process async with Rails - CreatorPlatform.xyz - Part 6

- rails g controller Webhooks
- update the file

```
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    event = Event.create!(
      data: params,
      source: params[:source],
    )
    HandleEventJob.perform_later(event)
    render json: { status: :ok }
  end
end
```

- update routes

```
post '/webhooks/:source', to: 'webhooks#create'
```

- rails g job HandleEvent

```

```

- bundle add sidekiq
- add to config/application.rb

```
config.active_job.queue_adapter = :sidekiq
```

- add to Procfile.dev (created when we added tailwind css)

```
worker: bundle exec sidekiq
```

- HE DID A BUNCH MORE STUFF, I THINK IM GOING TO USE PAY GEM FOR WEBHOOKS TO AVOID ALL THIS

### From: go rails - Stripe Checkout in Rails with the Pay gem
- https://www.youtube.com/watch?v=MKWq_soCzsQ

```
# pay says 'stripe must be version 8'
gem "stripe", "~> 8.0"

gem "pay"

gem "devise"
```

- rails g migration add_name_to_users first_name last_name
- rails db:migrate
- updated app controller

```
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end	
end
```

- updated the devise views with the fields
- EDITOR="subl --wait" rails credentials:edit
- add the code
```

development:
  stripe:
    # publication key:
    public_key: 1234
    # secret key:
    private_key: 1234
    # for the webhooks
    signing_secret: 12341234
```

- bin/rails pay:install:migrations
- bin/rails db:migrate
```
# config/application.rb
config.action_mailer.default_url_options = { host: "example.com" }
```
- in the video, he does: bin/rails g pay User (but i dont think the new version needs that instead, according to the github)
- instead, add to user.rb:
```
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  pay_customer stripe_attributes: :stripe_attributes
  # Or using a lambda:
  # pay_customer stripe_attributes: ->(pay_customer) { metadata: { { user_id: pay_customer.owner_id } } }

  def stripe_attributes(pay_customer)
    {
      address: {
        city: "Miami",
        country: "USA"
      },
      metadata: {
        pay_customer_id: pay_customer.id,
        user_id: id # or pay_customer.owner_id
      }
    }
  end
end
```

- in a terminal window, we need the secret
```
stripe listen --forward-to localhost:3000/pay/webhooks/stripe

- in cj avilla tutorial, he adds it to the procfile

stripe: stripe listen --forward-to localhost:3000/webhooks/stripe --forward-connect-to localhost:3000/webhooks/stripe

- im gonna try this one
stripe: stripe listen --forward-to localhost:3000/pay/webhooks/stripe
--forward-connect-to localhost:3000/pay/webhooks/stripe
```

- EDITOR="subl --wait" rails credentials:edit
- add the secret, it might always be the same one from this machine
- add to the layouts app: head

```
<script src="https://js.stripe.com/v3/"></script>  
```

- in routes commented out

```
# post '/webhooks/:source', to: 'webhooks#create'
```

- i removed from procfile; it was triggering redis etc.

```
worker: bundle exec sidekiq
```

- i commented out from config/app.rb

```
# config.active_job.queue_adapter = :sidekiq
```

- testing to see if stripe is connected

```
- rails c
- Rails.application.credentials[:development][:stripe][:private_key]
- list = Stripe::Customer.list() - to see if it works- IT WORKS
```

- ITS WORKING SO FAR
- testing if webhooks through pay is working
- in terminal:  curl -X POST localhost:3000/pay/webhooks/curl -d '{"data":"data"}'
- got some data, not sure if its correct, lets keep going
- his webhooks is routed to: post '/webhooks/:source', to: 'webhooks#create'
- so it creates an event, that's why he got status:ok, cuz it created an event
- i also tried: in terminal: stripe trigger customer.created
- in the log we can see something happened
- in rails c type

```
e = Stripe::Event.list
e.first (we should see the new event)
e.count (to see how many have been created)

- and in the webhooks listen terminal
23:10:31 stripe.1 | 2022-12-09 23:10:31  <--  [200] POST http://localhost:3000/pay/webhooks/stripe [evt_1MDKOQA7oRtiZVzRSx4NAY8x]

that should match the e.first
```

## Dashboard view with Tailwind UI - CreatorPlatform.xyz - Part 7
- I git cloned the app and copied over the logo images to assets/images

- rails g controller Dashboards show
- update file

```
<%= content_for :page_title do %>
Dashboard
<% end %>
<% if user_signed_in? %>
<div class="mt-4">
  <h3 class="text-lg leading-6 font-medium text-gray-900">Payments balance</h3>
  <dl class="mt-5 grid grid-cols-1 gap-5 sm:grid-cols-3">
    <div class="px-4 py-5 bg-white shadow rounded-lg overflow-hidden sm:p-6">
      <dt class="text-sm font-medium text-gray-500 truncate">Available</dt>
      <dd class="mt-1 text-3xl font-semibold text-gray-900"><%#= number_to_currency(@payments_balances.available.first.amount / 100.0) %></dd>
    </div>

    <div class="px-4 py-5 bg-white shadow rounded-lg overflow-hidden sm:p-6">
      <dt class="text-sm font-medium text-gray-500 truncate">Instant available</dt>
      <dd class="mt-1 text-3xl font-semibold text-gray-900"><%#= number_to_currency(@payments_balances.instant_available.first.amount / 100.0) %></dd>
    </div>

    <div class="px-4 py-5 bg-white shadow rounded-lg overflow-hidden sm:p-6">
      <dt class="text-sm font-medium text-gray-500 truncate">Pending</dt>
      <dd class="mt-1 text-3xl font-semibold text-gray-900"><%#= number_to_currency(@payments_balances.pending.first.amount / 100.0) %></dd>
    </div>
  </dl>
</div>

<form action="/payouts" method="post" data-turbo="false" class="mt-4">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
  <button type="submit" class="inline-flex items-center px-2 py-2 border border-transparent shadow-sm text-base font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
    Payout

    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
      <path stroke-linecap="round" stroke-linejoin="round" d="M19 13l-7 7-7-7m14-8l-7 7-7-7" />
    </svg>
  </button>
</form>

  <div class="mt-4">
    <h3 class="text-lg leading-6 font-medium text-gray-900">Financial account balance</h3>
    <dl class="mt-5 grid grid-cols-1 gap-5 sm:grid-cols-3">
      <div class="px-4 py-5 bg-white shadow rounded-lg overflow-hidden sm:p-6">
        <dt class="text-sm font-medium text-gray-500 truncate">Cash</dt>
        <dd class="mt-1 text-3xl font-semibold text-gray-900"><%#= number_to_currency(@financial_balances.cash.usd / 100.0) %></dd>
      </div>

      <div class="px-4 py-5 bg-white shadow rounded-lg overflow-hidden sm:p-6">
        <dt class="text-sm font-medium text-gray-500 truncate">Inbound pending</dt>
        <dd class="mt-1 text-3xl font-semibold text-gray-900"><%#= number_to_currency(@financial_balances.inbound_pending.usd / 100.0) %></dd>
      </div>

      <div class="px-4 py-5 bg-white shadow rounded-lg overflow-hidden sm:p-6">
        <dt class="text-sm font-medium text-gray-500 truncate">Outbound pending</dt>
        <dd class="mt-1 text-3xl font-semibold text-gray-900"><%#= number_to_currency(@financial_balances.outbound_pending.usd / 100.0) %></dd>
      </div>
    </dl>
  </div>
<% else %>
Create an account to get started <a href="/accounts">here</a>.
<% end %>
```

- update routes

```
resource :dashboard
```

- create file: layouts/marketing.html.erb
- update the file (this is for the root, non-logged in page)

```
<!DOCTYPE html>
<html class="h-full">
  <head>
    <title>Creators</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    <%= stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload" %>

    <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
  </head>

  <body class="h-full">
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
    <%= yield %>
  </body>
</html>
```

- update the layouts/application.html file (this is for every other page once logged in)

```
<!DOCTYPE html>
<html class="h-full">
  <head>
    <title>Creators</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <script src="https://js.stripe.com/v3/"></script>
    <%= stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload" %>
    <%#= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
    <%#= javascript_include_tag "application", "data-turbo-track": "reload", defer: true %>
  </head>

  <body class="h-full">
    <div class="min-h-full">
      <nav class="bg-white border-b border-gray-200">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex justify-between h-16">
            <div class="flex">
              <div class="flex-shrink-0 flex items-center">
                <img class="block lg:hidden h-8 w-auto" src="<%= image_path('logo.png') %>" alt="Workflow">
                <img class="hidden lg:block h-8 w-auto" src="<%= image_path('logo.png') %>" alt="Workflow">
              </div>
              <div class="hidden sm:-my-px sm:ml-6 sm:flex sm:space-x-8">
                <% menu_items.each do |item| %>
                  <% if item[:active] %>
                    <!-- Current: "border-blue-500 text-gray-900", Default: "border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700" -->
                    <a href="<%= item[:path] %>" class="border-blue-500 text-gray-900 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium" aria-current="page">
                      <%= item[:name] %>
                    </a>
                  <% else %>
                    <a href="<%= item[:path] %>" class="border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium">
                      <%= item[:name] %>
                    </a>
                  <% end %>
                <% end %>
              </div>
            </div>
            <div class="hidden sm:ml-6 sm:flex sm:items-center">
              <button type="button" class="bg-white p-1 rounded-full text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                <span class="sr-only">View notifications</span>
                <!-- Heroicon name: outline/bell -->
                <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                </svg>
              </button>

              <!-- Profile dropdown -->
              <div class="ml-3 relative">
                <div>
                  <button type="button" class="max-w-xs bg-white flex items-center text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                    <span class="sr-only">Open user menu</span>
                    <img class="h-8 w-8 rounded-full" src="<%= gravatar_url %>" alt="">
                  </button>
                </div>

                <!--
                  Dropdown menu, show/hide based on menu state.
                  Entering: "transition ease-out duration-200"
                  From: "transform opacity-0 scale-95"
                  To: "transform opacity-100 scale-100"
                  Leaving: "transition ease-in duration-75"
                  From: "transform opacity-100 scale-100"
                  To: "transform opacity-0 scale-95"
                -->
                <div class="hidden origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">
                  <!-- Active: "bg-gray-100", Not Active: "" -->
                  <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-0"> Your Profile </a>

                  <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-1"> Settings </a>

                  <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-2"> Sign out </a>
                </div>
              </div>
            </div>
            <div class="-mr-2 flex items-center sm:hidden">
              <!-- Mobile menu button -->
              <button type="button" class="bg-white inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500" aria-controls="mobile-menu" aria-expanded="false">
                <span class="sr-only">Open main menu</span>
                <!--
                  Heroicon name: outline/menu
                  Menu open: "hidden", Menu closed: "block"
                -->
                <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
                </svg>
                <!--
                  Heroicon name: outline/x
                  Menu open: "block", Menu closed: "hidden"
                -->
                <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>
          </div>
        </div>

        <!-- Mobile menu, show/hide based on menu state. -->
        <div class="sm:hidden" id="mobile-menu">
          <div class="pt-2 pb-3 space-y-1">
            <% menu_items.each do |item| %>
            <% if item[:active] %>
            <!-- Current: "bg-blue-50 border-blue-500 text-blue-700", Default: "border-transparent text-gray-600 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800" -->
            <a href="#" class="bg-blue-50 border-blue-500 text-blue-700 block pl-3 pr-4 py-2 border-l-4 text-base font-medium" aria-current="page"> Dashboard </a>
            <% else %>
            <a href="#" class="border-transparent text-gray-600 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800 block pl-3 pr-4 py-2 border-l-4 text-base font-medium"> Team </a>
            <% end %>
            <% end %>

            <a href="#" class="border-transparent text-gray-600 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800 block pl-3 pr-4 py-2 border-l-4 text-base font-medium"> Team </a>

            <a href="#" class="border-transparent text-gray-600 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800 block pl-3 pr-4 py-2 border-l-4 text-base font-medium"> Projects </a>

            <a href="#" class="border-transparent text-gray-600 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-800 block pl-3 pr-4 py-2 border-l-4 text-base font-medium"> Calendar </a>
          </div>
          <div class="pt-4 pb-3 border-t border-gray-200">
            <div class="flex items-center px-4">
              <div class="flex-shrink-0">
                <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
              </div>
              <div class="ml-3">
                <div class="text-base font-medium text-gray-800">Tom Cook</div>
                <div class="text-sm font-medium text-gray-500">tom@example.com</div>
              </div>
              <button type="button" class="ml-auto bg-white flex-shrink-0 p-1 rounded-full text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                <span class="sr-only">View notifications</span>
                <!-- Heroicon name: outline/bell -->
                <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                </svg>
              </button>
            </div>
            <div class="mt-3 space-y-1">
              <a href="#" class="block px-4 py-2 text-base font-medium text-gray-500 hover:text-gray-800 hover:bg-gray-100"> Your Profile </a>

              <a href="#" class="block px-4 py-2 text-base font-medium text-gray-500 hover:text-gray-800 hover:bg-gray-100"> Settings </a>

              <a href="#" class="block px-4 py-2 text-base font-medium text-gray-500 hover:text-gray-800 hover:bg-gray-100"> Sign out </a>
            </div>
          </div>
        </div>
      </nav>

      <div class="py-10">
        <header>
          <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <h1 class="text-3xl font-bold leading-tight text-gray-900">
              <%= yield :page_title %>
            </h1>
          </div>
        </header>
        <main>
          <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <%= yield %>
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
```

- update helper/application_helper

```
module ApplicationHelper

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(current_user.email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}"
  end

  def menu_items
    [{
      name: 'Dashboard',
      path: dashboard_path,
    }, {
      name: 'Accounts',
      path: "#"
    }, {
      name: 'Products',
      path: "#"
    }, {
      name: 'Store',
      path: "#"
    }, {
      name: 'Customers',
      path: "#"
    }, {
      name: 'Cardholders',
      path: "#"
    }].map do |item|
      {
        name: item[:name],
        path: item[:path],
        active: current_page?(item[:path])
      }
    end
  end
end
```

- update static_pages controller, to use the marketing layout

```
class StaticPagesController < ApplicationController
  layout 'marketing'
  def root
  end
end

```

- update static_pages/root to include the loge and images

```

<div class="bg-white">
  <div class="relative overflow-hidden">
    <header class="relative">
      <div class="bg-gray-900 pt-6">
        <nav class="relative max-w-7xl mx-auto flex items-center justify-between px-4 sm:px-6" aria-label="Global">
          <div class="flex items-center flex-1">
            <div class="flex items-center justify-between w-full md:w-auto">
              <a href="/">
                <span class="sr-only">CreatorPlatform.xyz</span>
                <img class="h-8 w-auto sm:h-10" src="<%= image_path('logo.png') %>" alt="">
              </a>
              <div class="-mr-2 flex items-center md:hidden">
                <button type="button" class="bg-gray-900 rounded-md p-2 inline-flex items-center justify-center text-gray-400 hover:bg-gray-800 focus:outline-none focus:ring-2 focus-ring-inset focus:ring-white" aria-expanded="false">
                  <span class="sr-only">Open main menu</span>
                  <!-- Heroicon name: outline/menu -->
                  <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
                  </svg>
                </button>
              </div>
            </div>
            <div class="hidden space-x-8 md:flex md:ml-10">
              <a href="/dashboard" class="text-base font-medium text-white hover:text-gray-300">Dashboard</a>
            </div>
          </div>
          <div class="hidden md:flex md:items-center md:space-x-6">
            <% if user_signed_in? %>
              <span class="text-white"><%= current_user.email %></span>
              <!-- <a href="/users/sign_out" class="inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md text-white bg-gray-600 hover:bg-gray-700">Sign out</a> -->
               <%= button_to "Sign out", destroy_user_session_path, method: :delete, class: "inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md text-white bg-gray-600 hover:bg-gray-700" %>
            <% else %>
              <a href="/users/sign_in" class="text-base font-medium text-white hover:text-gray-300"> Log in </a>
              <a href="/users/sign_up" class="inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md text-white bg-gray-600 hover:bg-gray-700">
              Register
            </a>
            <% end %>
          </div>
        </nav>
      </div>

      <!--
        Mobile menu, show/hide based on menu open state.

        Entering: "duration-150 ease-out"
          From: "opacity-0 scale-95"
          To: "opacity-100 scale-100"
        Leaving: "duration-100 ease-in"
          From: "opacity-100 scale-100"
          To: "opacity-0 scale-95"
      -->
      <div class="absolute top-0 inset-x-0 p-2 transition transform origin-top md:hidden">
        <div class="rounded-lg shadow-md bg-white ring-1 ring-black ring-opacity-5 overflow-hidden">
          <div class="px-5 pt-4 flex items-center justify-between">
            <div>
              <img class="h-8 w-auto" src="" alt="">
            </div>
            <div class="-mr-2">
              <button type="button" class="bg-white rounded-md p-2 inline-flex items-center justify-center text-gray-400 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-blue-600">
                <span class="sr-only">Close menu</span>
                <!-- Heroicon name: outline/x -->
                <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>
          </div>
          <div class="pt-5 pb-6">
            <div class="px-2 space-y-1">
              <a href="/dashboard" class="block px-3 py-2 rounded-md text-base font-medium text-gray-900 hover:bg-gray-50">Dashboard</a>
            </div>
            <div class="mt-6 px-5">
              <a href="/users/sign_up" class="block text-center w-full py-3 px-4 rounded-md shadow bg-gradient-to-r from-teal-500 to-blue-600 text-white font-medium hover:from-teal-600 hover:to-blue-700">Sign up</a>
            </div>
            <div class="mt-6 px-5">
              <p class="text-center text-base font-medium text-gray-500">Existing customer? <a href="/users/sign_in" class="text-gray-900 hover:underline">Login</a></p>
            </div>
          </div>
        </div>
      </div>
    </header>
    <main>
      <div class="pt-10 bg-gray-900 sm:pt-16 lg:pt-8 lg:pb-14 lg:overflow-hidden">
        <div class="mx-auto max-w-7xl lg:px-8">
          <div class="lg:grid lg:grid-cols-2 lg:gap-8">
            <div class="mx-auto max-w-md px-4 sm:max-w-2xl sm:px-6 sm:text-center lg:px-0 lg:text-left lg:flex lg:items-center">
              <div class="lg:py-24">
                <h1 class="mt-4 text-4xl tracking-tight font-extrabold text-white sm:mt-5 sm:text-6xl lg:mt-6 xl:text-6xl">
                  <span class="block">A better way to</span>
                  <span class="pb-3 block bg-clip-text text-transparent bg-gradient-to-r from-teal-200 to-blue-400 sm:pb-5">sell digital content</span>
                </h1>
                <p class="text-base text-gray-300 sm:text-xl lg:text-lg xl:text-xl">For digital creators of all sizes.</p>
                <div class="mt-10 sm:mt-12">
                  <% if !user_signed_in? %>
                    <form action="#" class="sm:max-w-xl sm:mx-auto lg:mx-0">
                      <div class="sm:flex">
                        <div class="min-w-0 flex-1">
                          <label for="email" class="sr-only">Email address</label>
                          <input id="email" type="email" placeholder="Enter your email" class="block w-full px-4 py-3 rounded-md border-0 text-base text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-400 focus:ring-offset-gray-900">
                        </div>
                        <div class="mt-3 sm:mt-0 sm:ml-3">
                          <button type="submit" class="block w-full py-3 px-4 rounded-md shadow bg-gradient-to-r from-teal-500 to-blue-600 text-white font-medium hover:from-teal-600 hover:to-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-400 focus:ring-offset-gray-900">Start free trial</button>
                        </div>
                      </div>
                      <p class="mt-3 text-sm text-gray-300 sm:mt-4">Start your free 14-day trial, no credit card necessary. By providing your email, you agree to our <a href="#" class="font-medium text-white">terms of service</a>.</p>
                    </form>
                  <% end %>
                </div>
              </div>
            </div>
            <div class="mt-12 -mb-16 sm:-mb-48 lg:m-0 lg:relative">
              <div class="mx-auto max-w-md px-4 sm:max-w-2xl sm:px-6 lg:max-w-none lg:px-0">
                <!-- Illustration taken from Lucid Illustrations: https://lucid.pixsellz.io/ -->
                <img class="w-full lg:absolute lg:inset-y-0 lg:left-0 lg:h-full lg:w-auto lg:max-w-none" src="https://tailwindui.com/img/component-images/cloud-illustration-teal-blue.svg" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Feature section with screenshot -->
      <div class="relative bg-gray-50 pt-16 sm:pt-24 lg:pt-32">
        <div class="mx-auto max-w-md px-4 text-center sm:px-6 sm:max-w-3xl lg:px-8 lg:max-w-7xl">
          <div>
            <h2 class="text-base font-semibold tracking-wider text-blue-600 uppercase">Content</h2>
            <p class="mt-2 text-3xl font-extrabold text-gray-900 tracking-tight sm:text-4xl">Videos | Courses | E-books</p>
            <p class="mt-5 max-w-prose mx-auto text-xl text-gray-500">Get paid and easily spend your funds. No bank account needed.</p>
          </div>
          <div class="mt-12 -mb-10 sm:-mb-24 lg:-mb-20">
            <img class="rounded-lg shadow-xl ring-1 ring-black ring-opacity-5" src="<%= image_path('dashboard.png') %>" alt="Creator platform dashboard">
          </div>
        </div>
      </div>

      <!-- Feature section with grid -->
      <div class="relative bg-white py-16 sm:py-24 lg:py-32">
        <div class="mx-auto max-w-md px-4 text-center sm:max-w-3xl sm:px-6 lg:px-8 lg:max-w-7xl">
          <h2 class="text-base font-semibold tracking-wider text-blue-600 uppercase">Sell faster</h2>
          <p class="mt-2 text-3xl font-extrabold text-gray-900 tracking-tight sm:text-4xl">Everything you need to sell your digital downloads</p>
          <p class="mt-5 max-w-prose mx-auto text-xl text-gray-500">We host your site so you don't have to.</p>
          <div class="mt-12">
            <div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/cloud-upload -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">Custom subdomains</h3>
                    <p class="mt-5 text-base text-gray-500">Sign up today to reserve your subdomain: <pre>your-store.creatorplatform.xyz</pre></p>
                  </div>
                </div>
              </div>

              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/lock-closed -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">SSL Certificates</h3>
                    <p class="mt-5 text-base text-gray-500">Qui aut temporibus nesciunt vitae dicta repellat sit dolores pariatur. Temporibus qui illum aut.</p>
                  </div>
                </div>
              </div>

              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/refresh -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">Issued cards</h3>
                    <p class="mt-5 text-base text-gray-500">Spend the money you earn with virtually issued cards.</p>
                  </div>
                </div>
              </div>

              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/shield-check -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">Advanced Security</h3>
                    <p class="mt-5 text-base text-gray-500">Ullam laboriosam est voluptatem maxime ut mollitia commodi. Et dignissimos suscipit perspiciatis.</p>
                  </div>
                </div>
              </div>

              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/cog -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                          <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">Powerful API</h3>
                    <p class="mt-5 text-base text-gray-500">Ab a facere voluptatem in quia corrupti veritatis aliquam. Veritatis labore quaerat ipsum quaerat id.</p>
                  </div>
                </div>
              </div>

              <div class="pt-6">
                <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
                  <div class="-mt-6">
                    <div>
                      <span class="inline-flex items-center justify-center p-3 bg-gradient-to-r from-teal-500 to-blue-600 rounded-md shadow-lg">
                        <!-- Heroicon name: outline/server -->
                        <svg class="h-6 w-6 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M5 12h14M5 12a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v4a2 2 0 01-2 2M5 12a2 2 0 00-2 2v4a2 2 0 002 2h14a2 2 0 002-2v-4a2 2 0 00-2-2m-2-4h.01M17 16h.01" />
                        </svg>
                      </span>
                    </div>
                    <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">Customer logins</h3>
                    <p class="mt-5 text-base text-gray-500">Enable customers to login to see what they purchased from you.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <footer class="bg-gray-50" aria-labelledby="footer-heading">
      <h2 id="footer-heading" class="sr-only">Footer</h2>
      <div class="max-w-md mx-auto pt-12 px-4 sm:max-w-7xl sm:px-6 lg:pt-16 lg:px-8">
        <div class="xl:grid xl:grid-cols-3 xl:gap-8">
          <div class="space-y-8 xl:col-span-1">
            <img class="h-10" src="<%= image_path('logo.png') %>" alt="CreatorPlatform.xyz">
            <p class="text-gray-500 text-base">The easiest way to sell your digital downloads.</p>
            <div class="flex space-x-6">
              <a href="https://twitter.com/cjav_dev" class="text-gray-400 hover:text-gray-500">
                <span class="sr-only">Twitter</span>
                <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                  <path d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84" />
                </svg>
              </a>

              <a href="https://github.com/cjavdev" class="text-gray-400 hover:text-gray-500">
                <span class="sr-only">GitHub</span>
                <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                  <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd" />
                </svg>
              </a>
            </div>
          </div>
          <div class="mt-12 grid grid-cols-2 gap-8 xl:mt-0 xl:col-span-2">
            <div class="md:grid md:grid-cols-2 md:gap-8">
              <div>
                <h3 class="text-sm font-semibold text-gray-400 tracking-wider uppercase">Solutions</h3>
                <ul role="list" class="mt-4 space-y-4">
                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Marketing </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Analytics </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Commerce </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Insights </a>
                  </li>
                </ul>
              </div>
              <div class="mt-12 md:mt-0">
                <h3 class="text-sm font-semibold text-gray-400 tracking-wider uppercase">Support</h3>
                <ul role="list" class="mt-4 space-y-4">
                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Pricing </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Documentation </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Guides </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> API Status </a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="md:grid md:grid-cols-2 md:gap-8">
              <div>
                <h3 class="text-sm font-semibold text-gray-400 tracking-wider uppercase">Company</h3>
                <ul role="list" class="mt-4 space-y-4">
                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> About </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Blog </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Jobs </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Press </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Partners </a>
                  </li>
                </ul>
              </div>
              <div class="mt-12 md:mt-0">
                <h3 class="text-sm font-semibold text-gray-400 tracking-wider uppercase">Legal</h3>
                <ul role="list" class="mt-4 space-y-4">
                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Claim </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Privacy </a>
                  </li>

                  <li>
                    <a href="#" class="text-base text-gray-500 hover:text-gray-900"> Terms </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="mt-12 border-t border-gray-200 py-8">
          <p class="text-base text-gray-400 xl:text-center">&copy; 2022 CreatorPlatform.xyz, Inc. All rights reserved.</p>
        </div>
      </div>
    </footer>
  </div>
</div>
```

- rails g controller Accounts index
- update routes

```
Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#root'
  # post '/webhooks/:source', to: 'webhooks#create'

  resource :dashboard
  resources :accounts
end

```

- update accounts/index file

```
<%= content_for :page_title do %>
Accounts
<% end %>
<div>
  <h1 class="font-bold text-4xl">Accounts#index</h1>
  <p>Find me in app/views/accounts/index.html.erb</p>
</div>

```
- update the app_helper

```
  def menu_items
    [{
      name: 'Dashboard',
      path: dashboard_path,
    }, {
      name: 'Accounts',
      path: accounts_path,
    }, {
```

- refresh and test the root, dashboard and accounts link and everything should be working, even with the menu items active class
- IT WORKED

## Stripe Connect onboarding with Ruby on Rails - CreatorPlatform.xyz - Part 8

- update accounts controller

```
class AccountsController < ApplicationController
  before_action :authenticate_user!
  def index
  end
end
```

- update dashboard controller

```
class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
  end
end
```

- rails g model Account stripe_id payouts_enabled:boolean charges_enabled:boolean user:references
- rails db:migrate
- create the folder app/stripe (we are going to keep all the stripe actions in this folder with classes)
- create the file stripe/stripe_account.rb (blank at the moment)
- update account controller

```

  def create
    @account = Account.find_or_create_by(user: current_user)
    # this calls the stripe/stripe_account class
    service = StripeAccount.new(@account)
    # create account and onboarding are methods in the class
    service.create_account
    redirect_to service.onboarding_url, allow_other_host: true, status: :see_other
  end  
```

- using things from here: https://stripe.com/docs/api/accounts/create
- update stripe/stripe_account

```
class StripeAccount
	attr_reader :account

  def initialize(account)
    @account = account
  end

  # from here: https://stripe.com/docs/api/accounts/create
  def create_account
    return if account.stripe_id.present?

    stripe_account = Stripe::Account.create(
      type: 'custom',
      country: 'US',
      email: account.user.email,
      capabilities: {
        card_payments: { requested: true },
        transfers: { requested: true },
        # Requested capabilities
        treasury: { requested: true },
        card_issuing: { requested: true },
      },
    )

    account.update(stripe_id: stripe_account.id)
  end
  
  # from here:https://stripe.com/docs/api/account_links/create
  def onboarding_url
    Stripe::AccountLink.create({
      account: account.stripe_id,
      refresh_url: accounts_url,
      return_url: accounts_url,
      type: 'account_onboarding',
      collect: 'eventually_due',
    }).url
  end  	
end
```

- restart server bin/dev
- went to accounts/index page and clicked the button, got the error

```
You can only create new accounts if you've signed up for Connect, which you can learn how to do at https://stripe.com/docs/connect.
```

- setting it up through here: https://stripe.com/docs/connect/enable-payment-acceptance-guide

- refreshed and pressed button, got the error: Unknown capability: treasury.
- I emailed the company to see how to turn on treasury
- THEY NEVER WROTE BACK< ILL KEEP GOING
- update stripe_account

```
include Rails.application.routes.url_helpers

  def default_url_options
    Rails.application.config.action_mailer.default_url_options
  end

  def onboarding_url
    link = Stripe::AccountLink.create({
      account: account.stripe_id,
      refresh_url: accounts_url,
      return_url: accounts_url,
      type: 'account_onboarding',
      collect: 'eventually_due',
    })
    link.url
  end   

  def create_account
    return if account.stripe_id.present?

    stripe_account = Stripe::Account.create(
      type: 'custom',
      country: 'US',
      email: account.user.email,
      business_type: 'individual', 
      individual: {
        email: account.user.email,
      },    
      business_profile: {
        product_description: 'Digital creations and content',
        mcc: "5818",
        support_email: account.user.email,
        url: 'https://cjav.dev',
      },           
      ........ rest of code    
```

- refresh and test out the create a stripe account button
- and it gets redireceted to stripe to fill in test data
- update accouts index, under the form just to see if it worked; since i counldnt set up treasury i put this
```
<%= current_user.account.stripe_id? ? current_user.account.stripe_id : "no account stripe id" %>
```
- update user.rb

```
has_one :account
```

- update the accounts index page

```
<%= content_for :page_title do %>
Accounts
<% end %>

<% if current_user.account.nil? %>
<form action="/accounts" method="POST" data-turbo="false" class="mt-4">
  <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
  <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
    Create a Stripe Account
  </button>
</form>
<% else %>
<div class="bg-white shadow overflow-hidden sm:rounded-lg mt-4">
  <div class="px-4 py-5 sm:px-6">
    <h3 class="text-lg leading-6 font-medium text-gray-900">Payment account information</h3>
    <p class="mt-1 max-w-2xl text-sm text-gray-500">Stripe Account</p>
  </div>
  <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
    <dl class="sm:divide-y sm:divide-gray-200">
      <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">Account ID</dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2"><%#= current_user.account.stripe_id %>
          <%= current_user.account.stripe_id? ? current_user.account.stripe_id : "no account stripe id" %>
        </dd>
      </div>
      <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">Charges enabled?</dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2"><%= current_user.account.charges_enabled? %></dd>
      </div>
      <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">Payouts enabled?</dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2"><%= current_user.account.payouts_enabled? %></dd>

      </div>
      <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">Financial Account ID</dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">   <%#= current_user.account.financial_account_id %>
          FINANCIAL ACCOUNT ID
        </dd>
      </div>
      <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium text-gray-500">External Account ID</dt>
        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2"><%#= current_user.account.external_account_id %>
          EXTERNAL ACCOUNT ID
        </dd>
      </div>
    </dl>
  </div>
</div>
<% end %>

```

- updated the jobs/handle_event_job, i just copied the final one

```
class HandleEventJob < ApplicationJob
  queue_as :default

  def perform(event)
    case event.source
    when 'stripe'
      handle_stripe_event(event)
    end
  end

  def handle_stripe_event(event)
    stripe_event = Stripe::Event.construct_from(event.data)
    case stripe_event.type
    when 'account.updated'
      handle_account_updated(stripe_event)
    when 'capability.updated'
      handle_capability_updated(stripe_event)
    when 'customer.created'
      handle_customer_created(stripe_event)
    when 'checkout.session.completed'
      handle_checkout_session_completed(stripe_event)
    when 'checkout.session.async_payment_succeeded'
      handle_checkout_session_completed(stripe_event)
    when 'treasury.financial_account.features_status_updated'
      handle_financial_account_features_status_updated(stripe_event)
    end
  end

  def handle_checkout_session_completed(stripe_event)
    session = Stripe::Checkout::Session.retrieve({
      id: stripe_event.data.object.id,
      expand: ['line_items'],
    }, {
      stripe_account: stripe_event.account,
    })

    return if session.payment_status != 'paid'

    product = Product.find_by(stripe_id: session.line_items.data[0].price.product)
    customer = Customer.find_or_initialize_by(
      stripe_id: session.customer,
      store: product.store
    )
    customer.email = session.customer_details.email
    customer.save!

    customer_product = CustomerProduct.create!(
      customer: customer,
      product: product,
      checkout_session_id: session.id,
    )
    OrderMailer.new_order(customer_product).deliver_later
  end

  def handle_financial_account_features_status_updated(stripe_event)
    financial_account = stripe_event.data.object
    if financial_account.active_features.include?('financial_addresses.aba')
      account = Account.find_by(stripe_id: stripe_event.account)
      service = StripeAccount.new(account)
      service.ensure_external_account
    end
  end

  def handle_capability_updated(stripe_event)
    capability = stripe_event.data.object
    if capability.id == 'treasury' && capability.status == 'active'
      # Create a financial account for the connected account
      account = Account.find_by(stripe_id: capability.account)
      service = StripeAccount.new(account)
      service.ensure_financial_account
    end
  end

  def handle_account_updated(stripe_event)
    stripe_account = stripe_event.data.object
    account = Account.find_by(stripe_id: stripe_account.id)
    account.update(
      charges_enabled: stripe_account.charges_enabled,
      payouts_enabled: stripe_account.payouts_enabled,
    )
  end

  def handle_customer_created(stripe_event)
    puts "customer.created #{stripe_event.data.object.id}"
  end
end
```

## Create Stripe Financial Accounts to store money - CreatorPlatform.xyz - Part 9
- updated handle event with capability
- added ensure_financial_account to stripe/stripe_account
- rails g migration AddFinancialAccountIdToAccounts financial_account_id
- rails db:migrate
- he used 'byebug ' to check an error, you need the gem: gem "byebug", "~> 11.1", :group => :development
- bundle add byebug --group development
- rails g migration AddExternalAccountIdToAccounts external_account_id
- rails db:migrate
- copied over the final stripe/stripe_account

## Financial Account balances and Payments balances - CreatorPlatform.xyz - Part 10
- update dashboards controller, i did stripe id cuz an account is created but there is no stripe id because i dont have treasury

```
class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    # if !current_user.account.nil?
    if current_user.account.stripe_id?
      @financial_balances = StripeAccount.new(current_user.account).financial_balances
      @payments_balances = StripeAccount.new(current_user.account).payments_balances
    end
  end
end

```

- update dashboards show view with the final code

## Stripe Payouts - CreatorPlatform.xyz - Part 11
- moving money from the payments balance to the financial account balance
- rails g controller Payouts
```
  before_action :authenticate_user!

  def create
    service = StripeAccount.new(current_user.account)
    service.payout

    redirect_to dashboard_path
  end
end

```

- create the payout method in stripe/stripe_account
- update routes

```
resources :payouts, only: [:create]
```

## Annotate gem - CreatorPlatform.xyz - Part 12

- bundle add annotate --group development
- rails g annotate:install
- bundle exec annotate --models

## Faker gem - CreatorPlatform.xyz - Part 13
- bundle add faker --group development
- rails c
- Faker:: (and tab through all the fields) then Faker::.Book (to see all the fields available)

## Enable creators to create Stripe Products with localized prices - CreatorPlatform.xyz - Part 14

- rails g model Product stripe_id stripe_price_id data:json name description
- update the migration
```
t.string :name, null: false
```

- rails db:migrate
- rails g migration AddUserToProducts user:references
- rails db:migrate
- update product.rb

```
class Product < ApplicationRecord
  belongs_to :user
end
```

- rails g controller Products index show new edit
- update routes: resources :products
- update app helper

```
  }, {
      name: 'Accounts',
      path: accounts_path,
    }, {
      name: 'Products',
      path: products_path,
```

- copy over the products/index
- update products controller

```
  before_action :authenticate_user!

  def index
    @products = current_user.products.order(created_at: :desc)
  end
```

- rails g migration MakeProductDescriptionText description:text
- update migation

```
change_column :products, :description, :text
```
- rails db:migrate
- copied over the products/new form
- update products controller with create

```
class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.products.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end


  def new
  end

  def edit
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      service = StripeProduct.new(params, @product)
      service.create_product
      redirect_to @product
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :photo)
  end    
end

```

- create the file stripe/stripe_product
- had to comment out the images section in the stripe_product and new form
- refresh and add product
- IT WORKED
- go to rails c
```
JSON.parse(Product.last.data)
to see what is in that json data field and read it better
```
- Using stimulus to add more currency fields
- rails g stimulus product_form
- (my app was messed up for some reason, i had to import the app.js and controller/index.js etc)
- update the product_form_conroller.js

```
export default class extends Controller {
  static targets = ['template', 'prices']
  connect() {
  }

  addPrice() {
    const template = this.templateTarget.innerHTML
    this.pricesTarget.insertAdjacentHTML(
      'beforeend',
      template
    )
  }
}
```
- DURING THE RAILS NEW, I DONT THINK THE ESBUILD WORKED SO THE APP HAS NO JAVASCRIPT AT THE MOMENT TO TEST THIS OUT
- in the stripe_account, this line was so the product is user specific; i got rid of it and it stil worked
```
    }, {
      stripe_account: product.user.account.stripe_id
    })

```
- ADDING THE CHECKOUT OF THE PRODUCT
- rails g controller checkouts
- update routes
```
resource :checkout
```

- update checkouts controller

```
class CheckoutsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    account = product.user.account

    checkout_session = Stripe::Checkout::Session.create({
      customer_email: "test+location_FR@example.com",
      mode: 'payment',
      success_url: root_url,
      cancel_url: root_url,
      line_items: [{
        price: product.stripe_price_id,
        quantity: 1,
      }],
    }, {
      stripe_account: account.stripe_id,
    })

    redirect_to checkout_session.url, allow_other_host: true, status: :see_other
  end
end

```

- add the to product show page a temporary checkout button

```
    <div>
      <form action="/checkout" method="post" data-turbo="false">
        <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
        <input type="hidden" name="product_id" value="<%= @product.id %>">
        <button type="submit" style="background-color: blue" class="w-full mt-4 items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
          Buy
        </button>
      </form>
    </div>
```

- refresh page and 
- IT WORKED
- to simulate a different country
- in the checkouts controller put; but since i dont have JS working, i didnt add another currency so it doesnt happen in mine

```
   checkout_session = Stripe::Checkout::Session.create({
      customer_email: "test+location_FR@example.com",
```

- added a price method to product.rb to work with the index page

```
# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  data            :json
#  description     :text
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  stripe_id       :string
#  stripe_price_id :string
#  user_id         :integer          not null
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Product < ApplicationRecord
  belongs_to :user

  def price

    product_data&.default_price&.unit_amount&.fdiv(100.0)
  end
  def product_data
    return if data.blank?
    Stripe::Product.construct_from(JSON.parse(data))
  end  
end

```

## Upload Product images with ActiveStorage - CreatorPlatform.xyz - Part 15
- rails active_storage:install
- brew install vips (for image processing)
- bundle add image_processing
- rails db:migrate:status
- rails db:migrate
- update product.rb

```
has_one_attached :photo

//he did this but neither vips nor imagemagick is wokring on my machine so no variants
  # has_one_attached :photo do |photo|
  #   photo.variant :thumb, resize_to_limit: [100, 100]
  #   photo.variant :medium, resize_to_limit: [400, 400]
  # end
```

- udate products controller

```
params.require(:product).permit(:name, :description, :photo)
```

- add the image input to products/new
- restart the gem
- 


=> #<ActionController::Parameters {"name"=>"Amsterdam", "description"=>"The climate of hate", "photo"=>"Amsterdam.jpg"} permitted: true>