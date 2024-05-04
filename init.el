;;Removendo o boas vindas
(setq inhibit-startup-message t)

;;Tela cheia quando inicia
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;;Numero nas linhas
(global-display-line-numbers-mode 1)

;;Exide a coluna atual na modeline
(column-number-mode t)

;;Exibe destaque de linha
(global-hl-line-mode 0)

;;Alerta visual
(setq visible-bell t)

;;Espaçamento das bordas laterais
(set-fringe-mode 10)

;;Ajustes para sanidade mental
;;Desabilita Ctrl-z
(global-unset-key (kbd "C-z"))

;;O texto digitado substitui a seleção
(delete-selection-mode t)

;;Rolagem mais suave
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1)) ;2 linhas pro vez
      mouse-wheel-progressive-speed nil            ;Não acelera a rolagem
      mouse-wheel-follow-mouse 't                  ;Rola a janela sob o mouse
      scroll-step 1)                               ;Rola 1 linha com teclado

;;Quebra de linha
(global-visual-line-mode t)


;;Definição temporária do tema
(load-theme 'tango-dark t)

;;Mudando o cursor (box, bar, hbar)
(setq-default cursor-type 'bar)


;;Função para criar um novo buffer
(defun debmx-new-buffer ()
  "Cria um novo buffer `sem nome'."
  (interactive)
  (let ((debmx/buf (generate-new-buffer "sem-nome")))
    (switch-to-buffer debmx/buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)
    debmx/buf))

;;Modo inicial
(setq initial-major-mode 'prog-mode)
;;(setq initial-buffer-choice 'debmx-new-buffer)


;;Organizando os backups
(setq backup-directory-alist `(("." . "~/.saves")))


;;Verifica e inicia o package.el
;; (require 'package)

;; ;;Definição de repositórios
;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;; 			 ("org" . "https://orgmode.org/elpa/")
;; 			 ("elpa" . "https://elpa.gnu.org/packages/")))

;; ;;Inicialização do sistema de pacotes
;; (package-initialize)
;;  (unless package-archive-contents
;;   (package-refresh-contents))

;; ;;Instalação do use-package
;; (unless (package-installed-p 'use-package)
;;   (package-install 'use-package))

;; (require 'use-package)
;; (setq use-package-always-ensure t)


;;Pacotes
(require 'package)
(setq package-enable-at-startup nil)	;Desabilitar inicio de pacotes

;;Melpa repositorio
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize) ;Inciando os pacotes de novo

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

(use-package all-the-icons
  :ensure t)

;;Navegação entre janelas
(use-package neotree
  :ensure t
  :bind (("C-\\" . 'neotree-toggle))) ;;atalho para iniciar



;;Salvador do C-c C-v
(use-package ergoemacs-mode
  :ensure t
  :config
  (progn
    (setq ergoemacs-theme nil)
    (setq ergoemacs-keyboard-layout "us")
    (ergoemacs-mode 1)))

;;Analizador de sintaxe
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))

;;Alt-0 mata o buffer
;;Alt-A abre a linha de comand
;;C-\ abre o neotree
;;C-n cria um novo arquivo


;;Nossos atalhos
(global-set-key (kbd "C-<tab>") 'other-window) ;Mudar de janela
(global-set-key (kbd "M-<down>") 'enlarge-window) ;M = alt
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flycheck ergoemacs-mode all-the-icons neotree try auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
